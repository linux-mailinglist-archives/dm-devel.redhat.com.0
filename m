Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 591B31CB503
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 18:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588955549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4nDlfbDVj01piP/SS4LPc9aBakQRFUjpqEcV4v3Ck68=;
	b=Mwyk10milgvxW6nRFv45XMcWo61dJc/ybhATGNGKzcRMMvHBfNLkOtZu7fZKHQQBBahNFo
	SI7GomgAaO0KKhR7AD0+x7EFGmazPa90V3/rg91XrWX7QGf9VLWvP9L5ZHedJZlVQJT9Hy
	vfDK1vsQPBk/mrhuh5SyBjKR6bb3Bag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388--9oKcHJPMBWCLeOlJd0Zzg-1; Fri, 08 May 2020 12:32:24 -0400
X-MC-Unique: -9oKcHJPMBWCLeOlJd0Zzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61CB2107ACF6;
	Fri,  8 May 2020 16:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68D05D9CA;
	Fri,  8 May 2020 16:32:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFE771809543;
	Fri,  8 May 2020 16:32:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048GW8x8000447 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 12:32:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD4655D9CD; Fri,  8 May 2020 16:32:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD6A5D9CC;
	Fri,  8 May 2020 16:32:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 048GW11E030486; 
	Fri, 8 May 2020 11:32:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 048GW0OO030485;
	Fri, 8 May 2020 11:32:00 -0500
Date: Fri, 8 May 2020 11:32:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200508163200.GQ5907@octiron.msp.redhat.com>
References: <1588372766-21317-1-git-send-email-bmarzins@redhat.com>
	<55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: simplify failed wwid code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 08, 2020 at 09:15:32AM +0000, Martin Wilck wrote:
> On Fri, 2020-05-01 at 17:39 -0500, Benjamin Marzinski wrote:
> > The (is|mark|unmark)_failed_wwid code is needlessly complicated.
> > Locking a file is necssary if multiple processes could otherwise be
> > writing to it at the same time. That is not the case with the
> > failed_wwids files. They can simply be empty files in a
> > directory.  Even
> > with all the locking in place, two processes accessing or modifying a
> > file at the same time will still race. And even without the locking,
> > if
> > two processes try to access or modify a file at the same time, they
> > will
> > both see a reasonable result, and will leave the files in a valid
> > state
> > afterwards.
> > 
> > Instead of doing all the locking work (which made it necessary to
> > write
> > a file, even just to check if a file existed), simply check for files
> > with lstat(), create them with open(), and remove them with unlink().
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/wwids.c | 131 ++++++++++++++++++-----------------------
> > --
> >  1 file changed, 56 insertions(+), 75 deletions(-)
> 
> I agree, almost :-)
> 
> Please consider adding the attached patch on top, which switches back
> to atomic creation of the failed_wwids file, with just a little bit
> more compexity. I prefer the creation of the file to be atomic on the
> file system level. IMO that's how "flag" files like this should be
> handled in principle, and doing it correctly makes me feel better, even
> though I have to concur that an actual race is hardly possible.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

Or where you looking for me to respin with this included? Either way is
fine.
 
> Regards,
> Martin
> 

> From d0e4669c92863f98cdbe7b41a8a9b64223958bec Mon Sep 17 00:00:00 2001
> From: Martin Wilck <mwilck@suse.com>
> Date: Fri, 8 May 2020 00:51:50 +0200
> Subject: [PATCH] libmultipath: use atomic linkat() in mark_failed_wwid()
> 
> This keeps (almost) the simplicity of the previous patch, while
> making sure that the return value of mark_failed_wwid()
> (WWID_FAILED_CHANGED vs. WWID_FAILED_UNCHANGED) is correct, even
> if several processes access this WWID at the same time.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/wwids.c | 42 +++++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
> index b15b146b..ccdd13d2 100644
> --- a/libmultipath/wwids.c
> +++ b/libmultipath/wwids.c
> @@ -374,7 +374,7 @@ int is_failed_wwid(const char *wwid)
>  
>  	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
>  		condlog(1, "%s: path name overflow", __func__);
> -		return -1;
> +		return WWID_FAILED_ERROR;
>  	}
>  
>  	if (lstat(path, &st) == 0)
> @@ -390,27 +390,43 @@ int is_failed_wwid(const char *wwid)
>  
>  int mark_failed_wwid(const char *wwid)
>  {
> -	char path[PATH_MAX];
> -	int r, fd;
> +	char tmpfile[WWID_SIZE + 2 * sizeof(long) + 1];
> +	int r = WWID_FAILED_ERROR, fd, dfd;
>  
> -	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
> -		condlog(1, "%s: path name overflow", __func__);
> -		return -1;
> +	dfd = open(shm_dir, O_RDONLY|O_DIRECTORY);
> +	if (dfd == -1 && errno == ENOENT) {
> +		char path[sizeof(shm_dir) + 2];
> +
> +		/* arg for ensure_directories_exist() must not end with "/" */
> +		safe_sprintf(path, "%s/_", shm_dir);
> +		ensure_directories_exist(path, 0700);
> +		dfd = open(shm_dir, O_RDONLY|O_DIRECTORY);
>  	}
> -	if (ensure_directories_exist(path, 0700) < 0) {
> -		condlog(1, "%s: can't setup directories", __func__);
> -		return -1;
> +	if (dfd == -1) {
> +		condlog(1, "%s: can't setup %s: %m", __func__, shm_dir);
> +		return WWID_FAILED_ERROR;
>  	}
>  
> -	fd = open(path, O_RDONLY | O_CREAT | O_EXCL, S_IRUSR);
> -	if (fd >= 0) {
> +	safe_sprintf(tmpfile, "%s.%lx", wwid, (long)getpid());
> +	fd = openat(dfd, tmpfile, O_RDONLY | O_CREAT | O_EXCL, S_IRUSR);
> +	if (fd >= 0)
>  		close(fd);
> +	else
> +		goto out_closedir;
> +
> +	if (linkat(dfd, tmpfile, dfd, wwid, 0) == 0)
>  		r = WWID_FAILED_CHANGED;
> -	} else if (errno == EEXIST)
> +	else if (errno == EEXIST)
>  		r = WWID_FAILED_UNCHANGED;
>  	else
>  		r = WWID_FAILED_ERROR;
>  
> +	if (unlinkat(dfd, tmpfile, 0) == -1)
> +		condlog(2, "%s: failed to unlink %s/%s: %m",
> +			__func__, shm_dir, tmpfile);
> +
> +out_closedir:
> +	close(dfd);
>  	print_failed_wwid_result("mark_failed", wwid, r);
>  	return r;
>  }
> @@ -422,7 +438,7 @@ int unmark_failed_wwid(const char *wwid)
>  
>  	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
>  		condlog(1, "%s: path name overflow", __func__);
> -		return -1;
> +		return WWID_FAILED_ERROR;
>  	}
>  
>  	if (unlink(path) == 0)
> -- 
> 2.26.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

