Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A01515A5256
	for <lists+dm-devel@lfdr.de>; Mon, 29 Aug 2022 18:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661792163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mrmKp4YtomgAUBh8bTHQPOM3DeW7KFqqYLIXe7edmN8=;
	b=bpOmQX5xbMZudKql7kkqdK53FR62lTKfndrG22Kvpi5nb5NG144a+enyMzFrpd+vEd71sc
	SNUy4Ot//wp5BltjxKPRMV3RW26a6vH09xvVbrDf/kHwm9LVhVJaxH+1DbqvgNuE5OQLJH
	BfgRa6tf2u70oMyPccOfdwdhGtqTeIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-R080J6VbPiqNVSBa1XW31A-1; Mon, 29 Aug 2022 12:56:01 -0400
X-MC-Unique: R080J6VbPiqNVSBa1XW31A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B9FB811E76;
	Mon, 29 Aug 2022 16:55:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BF361410F36;
	Mon, 29 Aug 2022 16:55:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 929481946A4E;
	Mon, 29 Aug 2022 16:55:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 471FD1946A40
 for <dm-devel@listman.corp.redhat.com>; Mon, 29 Aug 2022 16:55:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F41742026D64; Mon, 29 Aug 2022 16:55:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3442026D4C;
 Mon, 29 Aug 2022 16:55:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 27TGtgtv023956;
 Mon, 29 Aug 2022 11:55:42 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 27TGtfPm023955;
 Mon, 29 Aug 2022 11:55:41 -0500
Date: Mon, 29 Aug 2022 11:55:41 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220829165541.GD16874@octiron.msp.redhat.com>
References: <20220822204119.20719-1-mwilck@suse.com>
 <20220822204119.20719-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220822204119.20719-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH v2 01/11] multipathd: replace libreadline
 with getline()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 22, 2022 at 10:41:09PM +0200, mwilck@suse.com wrote:
> From: Hannes Reinecke <hare@suse.de>
> 
> libreadline changed the license to be incompatible with multipath-tools
> usage, so replace it with a simple getline().
> 
> mwilck: Make this the default option via Makefile.inc; it is used if
> READLINE is unset. Compiling with READLINE=libreadline or READLINE=libedit
> remains possible.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  Makefile.inc        |  4 ++--
>  multipathd/cli.c    |  2 ++
>  multipathd/uxclnt.c | 50 ++++++++++++++++++++++++++++++---------------
>  3 files changed, 38 insertions(+), 18 deletions(-)
> 
> diff --git a/Makefile.inc b/Makefile.inc
> index ad7afd0..0653d21 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -9,10 +9,10 @@
>  # Uncomment to disable dmevents polling support
>  # ENABLE_DMEVENTS_POLL = 0
>  #
> -# Readline library to use, libedit or libreadline
> +# Readline library to use, libedit, libreadline, or empty
>  # Caution: Using libreadline may make the multipathd binary undistributable,
>  # see https://github.com/opensvc/multipath-tools/issues/36
> -READLINE = libedit
> +READLINE := 

Trailing whitespace nitpick.

>  
>  # List of scsi device handler modules to load on boot, e.g.
>  # SCSI_DH_MODULES_PRELOAD := scsi_dh_alua scsi_dh_rdac
> diff --git a/multipathd/cli.c b/multipathd/cli.c
> index fa482a6..cc56950 100644
> --- a/multipathd/cli.c
> +++ b/multipathd/cli.c
> @@ -459,6 +459,7 @@ void cli_exit(void)
>  	keys = NULL;
>  }
>  
> +#if defined(USE_LIBREADLINE) || defined(USE_LIBEDIT)
>  static int
>  key_match_fingerprint (struct key * kw, uint64_t fp)
>  {
> @@ -564,3 +565,4 @@ key_generator (const char * str, int state)
>  	 */
>  	return ((char *)NULL);
>  }
> +#endif

It's kind of odd to not define key_generator(), but leave it defined in
cli.h if no library is defined.

> diff --git a/multipathd/uxclnt.c b/multipathd/uxclnt.c
> index 251e7d7..b817bea 100644
> --- a/multipathd/uxclnt.c
> +++ b/multipathd/uxclnt.c
> @@ -30,6 +30,7 @@
>  #include "defaults.h"
>  
>  #include "vector.h"
> +#include "util.h"
>  #include "cli.h"
>  #include "uxclnt.h"
>  
> @@ -77,35 +78,52 @@ static int need_quit(char *str, size_t len)
>   */
>  static void process(int fd, unsigned int timeout)
>  {
> -	char *line;
> -	char *reply;
> -	int ret;
>  
> -	cli_init();
> +#if defined(USE_LIBREADLINE) || defined(USE_LIBEDIT)
>  	rl_readline_name = "multipathd";
>  	rl_completion_entry_function = key_generator;
> -	while ((line = readline("multipathd> "))) {
> -		size_t llen = strlen(line);
> +#endif
>  
> -		if (!llen) {
> -			free(line);
> +	cli_init();
> +	for(;;)
> +	{
> +		char *line __attribute__((cleanup(cleanup_charp))) = NULL;
> +		char *reply __attribute__((cleanup(cleanup_charp))) = NULL;
> +		ssize_t llen;
> +		int ret;
> +
> +#if defined(USE_LIBREADLINE) || defined(USE_LIBEDIT)
> +		line = readline("multipathd> ");
> +		if (!line)
> +			break;
> +		llen = strlen(line);
> +		if (!llen)
>  			continue;
> +#else
> +		size_t lsize = 0;
> +
> +		fputs("multipathd> ", stdout);
> +		errno = 0;
> +		llen = getline(&line, &lsize, stdin);
> +		if (llen == -1) {
> +			if (errno != 0)
> +				fprintf(stderr, "Error in getline: %m");
> +			break;
>  		}
> +		if (!llen || !strcmp(line, "\n"))
> +			continue;
> +#endif
>  
>  		if (need_quit(line, llen))
>  			break;
>  
> -		if (send_packet(fd, line) != 0) break;
> +		if (send_packet(fd, line) != 0)
> +			break;
>  		ret = recv_packet(fd, &reply, timeout);
> -		if (ret != 0) break;
> +		if (ret != 0)
> +			break;
>  
>  		print_reply(reply);
> -
> -		if (line && *line)
> -			add_history(line);
> -
> -		free(line);
> -		free(reply);

Why drop add_history() support even if a library is defined?

-Ben

>  	}
>  }
>  
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

