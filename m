Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C09602DE8DC
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 19:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608315475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=94q+HTjr+73aC+6qJEXeRnUFKDqwCad4Ls7LA3kq7As=;
	b=GR5P/bLyqk1i2yHuivGtgU1S50DVmOM8IzUBxR+4ZK2Y8vHiFtoWb5R2MXdpUu6KgE2y5R
	ennB87FZiAezlyfEfxas8edPfKFmg3MO3IfwnhR02hgUz8tNwJSOCLaPJtmjT1FDJPM+1U
	7jWE+Qpuv/xlFtZnVeIgT33/HjfLZX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-uOxRSbnKNTuV6QD-IbSm3A-1; Fri, 18 Dec 2020 13:17:53 -0500
X-MC-Unique: uOxRSbnKNTuV6QD-IbSm3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DFBC59;
	Fri, 18 Dec 2020 18:17:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214FDE70E;
	Fri, 18 Dec 2020 18:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 023875002C;
	Fri, 18 Dec 2020 18:17:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIIEDDd000493 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 13:14:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4BCED100238C; Fri, 18 Dec 2020 18:14:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A7010013C0;
	Fri, 18 Dec 2020 18:14:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIIE87D008465; 
	Fri, 18 Dec 2020 12:14:08 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIIE8Hq008464;
	Fri, 18 Dec 2020 12:14:08 -0600
Date: Fri, 18 Dec 2020 12:14:08 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218181408.GL3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-6-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201217110018.3347-6-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 5/7] multipath-tools: avoid access to
	/etc/localtime
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 12:00:16PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If the root file system is multipathed, and IO is queued because all paths
> are failed, multipathd may block trying to access the root FS, and thus be
> unable to reinstate paths. One file that is frequently accessed is
> /etc/localtime. Avoid that by printing monotonic timestamps instead.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/debug.c     | 14 ++++++++------
>  libmultipath/devmapper.c | 12 ++++++------
>  libmultipath/log.c       |  1 -
>  multipathd/main.c        |  3 ---
>  4 files changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/libmultipath/debug.c b/libmultipath/debug.c
> index 429f269..510e15e 100644
> --- a/libmultipath/debug.c
> +++ b/libmultipath/debug.c
> @@ -14,6 +14,8 @@
>  #include "config.h"
>  #include "defaults.h"
>  #include "debug.h"
> +#include "time-util.h"
> +#include "util.h"
>  
>  int logsink;
>  int libmp_verbosity = DEFAULT_VERBOSITY;
> @@ -25,13 +27,13 @@ void dlog(int prio, const char * fmt, ...)
>  	va_start(ap, fmt);
>  	if (logsink != LOGSINK_SYSLOG) {
>  		if (logsink == LOGSINK_STDERR_WITH_TIME) {
> -			time_t t = time(NULL);
> -			struct tm *tb = localtime(&t);
> -			char buff[16];
> +			struct timespec ts;
> +			char buff[32];
>  
> -			strftime(buff, sizeof(buff),
> -				 "%b %d %H:%M:%S", tb);
> -			buff[sizeof(buff)-1] = '\0';
> +			get_monotonic_time(&ts);
> +			safe_sprintf(buff, "%ld.%06ld",
> +				     (long)ts.tv_sec,
> +				     ts.tv_nsec/1000);
>  			fprintf(stderr, "%s | ", buff);
>  		}
>  		vfprintf(stderr, fmt, ap);
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 4977b31..095cbc0 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -27,6 +27,7 @@
>  #include "config.h"
>  #include "wwids.h"
>  #include "version.h"
> +#include "time-util.h"
>  
>  #include "log_pthread.h"
>  #include <sys/types.h>
> @@ -106,13 +107,12 @@ dm_write_log (int level, const char *file, int line, const char *f, ...)
>  	va_start(ap, f);
>  	if (logsink != LOGSINK_SYSLOG) {
>  		if (logsink == LOGSINK_STDERR_WITH_TIME) {
> -			time_t t = time(NULL);
> -			struct tm *tb = localtime(&t);
> -			char buff[16];
> -
> -			strftime(buff, sizeof(buff), "%b %d %H:%M:%S", tb);
> -			buff[sizeof(buff)-1] = '\0';
> +			struct timespec ts;
> +			char buff[32];
>  
> +			get_monotonic_time(&ts);
> +			safe_sprintf(buff, "%ld.%06ld",
> +				     (long)ts.tv_sec, ts.tv_nsec/1000);
>  			fprintf(stderr, "%s | ", buff);
>  		}
>  		fprintf(stderr, "libdevmapper: %s(%i): ", file, line);
> diff --git a/libmultipath/log.c b/libmultipath/log.c
> index 95c8f01..6498c88 100644
> --- a/libmultipath/log.c
> +++ b/libmultipath/log.c
> @@ -120,7 +120,6 @@ void log_reset (char *program_name)
>  	pthread_cleanup_push(cleanup_mutex, &logq_lock);
>  
>  	closelog();
> -	tzset();
>  	openlog(program_name, 0, LOG_DAEMON);
>  
>  	pthread_cleanup_pop(1);
> diff --git a/multipathd/main.c b/multipathd/main.c
> index b6a5f5b..28c147b 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2710,9 +2710,6 @@ reconfigure (struct vectors * vecs)
>  	delete_all_foreign();
>  
>  	reset_checker_classes();
> -	/* Re-read any timezone changes */
> -	tzset();
> -
>  	if (bindings_read_only)
>  		conf->bindings_read_only = bindings_read_only;
>  	check_alias_settings(conf);
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

