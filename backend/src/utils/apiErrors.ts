interface IApiErrors {
  badRequest: (message: string) => IResponse;
  unauthorized: (message: string) => IResponse;
  forbidden: (message: string) => IResponse;
  notFound: (message: string) => IResponse;
  limit: (message: string) => IResponse;
}

interface IResponse {
  message: string;
  status: number;
}

export const apiErrors: IApiErrors = {
  badRequest: (message = "Bad Request") => {
    return {
      status: 400,
      message,
    };
  },
  unauthorized: (message = "Unauthorized") => {
    return {
      status: 401,
      message,
    };
  },
  forbidden: (message = "Forbidden") => {
    return {
      status: 403,
      message,
    };
  },
  notFound: (message = "notFound") => {
    return {
      status: 404,
      message,
    };
  },
  limit: (message = "Too many requests") => {
    return {
      status: 429,
      message,
    };
  },
};
