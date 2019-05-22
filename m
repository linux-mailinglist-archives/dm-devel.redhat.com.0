Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8E26BC6
	for <lists+dm-devel@lfdr.de>; Wed, 22 May 2019 21:30:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1B96307D96D;
	Wed, 22 May 2019 19:29:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53E752D2;
	Wed, 22 May 2019 19:29:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C1561806B16;
	Wed, 22 May 2019 19:29:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MJSOMU005244 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 15:28:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE6F01001E84; Wed, 22 May 2019 19:28:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2AB31001E82;
	Wed, 22 May 2019 19:28:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4MJSIYN007607; 
	Wed, 22 May 2019 14:28:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4MJSGCm007606;
	Wed, 22 May 2019 14:28:16 -0500
Date: Wed, 22 May 2019 14:28:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190522192815.GK3090@octiron.msp.redhat.com>
References: <20190517225703.16295-1-mwilck@suse.com>
	<20190517225703.16295-3-mwilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517225703.16295-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, dbond@octiron.msp.redhat.com
Subject: Re: [dm-devel] [RFC PATCH 2/7] mpathpersist: add option
	--batch-file (-f)
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 22 May 2019 19:30:07 +0000 (UTC)

On Sat, May 18, 2019 at 12:56:58AM +0200, Martin Wilck wrote:
> Add the option --batch-file (-f) to mpathpersist. The option argument
> is a text file that is parsed line-by-line. Every line of the file is
> interpreted as an additional input line for mpathpersist. The initial
> "mpathpersist" on each line is optional. The '#' character denotes
> a comment. '#' is only recognized after whitespace. Empty lines,
> or comment lines, are allowed.
> 
> If -f is given, other command line options are parsed as usual and
> commands (if any) are run before running the batch file. Inside the
> batch file, the option -f is forbidden, and -v is ignored. If a command
> fails, the batch processing is not aborted. The return status of
> mpathpersist is 0 if all commands succeeded, and the status of the
> first failed command otherwise.

One small issue. Otherwise, this looks good.

> ---
>  mpathpersist/main.c | 195 +++++++++++++++++++++++++++++++++++---------
>  mpathpersist/main.h |   1 +
>  2 files changed, 159 insertions(+), 37 deletions(-)
> 

<snip>

> @@ -487,10 +567,51 @@ int main (int argc, char * argv[])
>  	}
>  
>  out :
> -	if (ret == MPATH_PR_SYNTAX_ERROR)
> -		usage();
> -	mpath_lib_exit(conf);
> +	if (ret == MPATH_PR_SYNTAX_ERROR) {

It's possible to set batch_fn, and then later fail with
MPATH_PR_SYNTAX_ERROR. In that case, you should still free batch_fn.

-Ben

> +		if (nline == 0)
> +			usage();
> +		else
> +			fprintf(stderr, "syntax error on line %d in batch file\n",
> +				nline);
> +	} else if (batch_fn != NULL) {
> +		int rv = do_batch_file(batch_fn);
> +
> +		free(batch_fn);
> +		ret = ret == 0 ? rv : ret;
> +	}
> +	return (ret >= 0) ? ret : MPATH_PR_OTHER;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int ret;
> +
> +	if (optind == argc)
> +	{
> +
> +		fprintf (stderr, "No parameter used\n");
> +		usage ();
> +		exit (1);
> +	}
> +
> +	if (getuid () != 0)
> +	{
> +		fprintf (stderr, "need to be root\n");
> +		exit (1);
> +	}
> +
> +	udev = udev_new();
> +	multipath_conf = mpath_lib_init();
> +	if(!multipath_conf) {
> +		udev_unref(udev);
> +		exit(1);
> +	}
> +
> +	ret = handle_args(argc, argv, 0);
> +
> +	mpath_lib_exit(multipath_conf);
>  	udev_unref(udev);
> +
>  	return (ret >= 0) ? ret : MPATH_PR_OTHER;
>  }
>  
> diff --git a/mpathpersist/main.h b/mpathpersist/main.h
> index beb8a21b..c5f53f52 100644
> --- a/mpathpersist/main.h
> +++ b/mpathpersist/main.h
> @@ -23,6 +23,7 @@ static struct option long_options[] = {
>  	{"reserve", 0, NULL, 'R'},
>  	{"transport-id", 1, NULL, 'X'},
>  	{"alloc-length", 1, NULL, 'l'},
> +	{"batch-file", 1, NULL, 'f' },
>  	{NULL, 0, NULL, 0}
>  };
>  
> -- 
> 2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
