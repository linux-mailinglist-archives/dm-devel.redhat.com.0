Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D005759EE7E
	for <lists+dm-devel@lfdr.de>; Tue, 23 Aug 2022 23:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661291635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ns/lz2TrQtyOdyhGw793J/WXnuRqt3qQDCFptzYsmQo=;
	b=CWOVmtJnqAjU40RVSLRY5MrupN6EnXQmnKYPFd7Tv7pAbA26gXlkbyhk1taQFRnejV6/+p
	fZuEhJepx4Mp3SnhEbj+wNOqk75l/tJPdH+bUh8WlYLN4hwPLLERKl2m2/Y06qEwdU8tXl
	+0ow4lIbyOU/baokoToUDhqmOOklU58=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-BCsLcLw4MX2QnX2CWWFRKQ-1; Tue, 23 Aug 2022 17:53:52 -0400
X-MC-Unique: BCsLcLw4MX2QnX2CWWFRKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1172B1C14D26;
	Tue, 23 Aug 2022 21:53:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7A1E492C3B;
	Tue, 23 Aug 2022 21:53:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 851751946A5B;
	Tue, 23 Aug 2022 21:53:44 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AEF1D1946A40
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 Aug 2022 21:53:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 82F5F2026D64; Tue, 23 Aug 2022 21:53:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD982026D4C;
 Tue, 23 Aug 2022 21:53:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 27NLrggm015686;
 Tue, 23 Aug 2022 16:53:42 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 27NLrfSb015685;
 Tue, 23 Aug 2022 16:53:41 -0500
Date: Tue, 23 Aug 2022 16:53:41 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220823215341.GZ10602@octiron.msp.redhat.com>
References: <20220818210630.19395-1-mwilck@suse.com>
 <20220818210630.19395-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220818210630.19395-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 3/3] multipath: optimize program startup for
 frequent invocations
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 18, 2022 at 11:06:30PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Neither "multipath -u" nor "multipath -U" need initialization of the
> prioritizers, checkers, and foreign libraries. Also, these commands
> need not fail if the bindings file is inconsistent. Move these
> possibly slow initialization steps after these special command
> invocations.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipath/main.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index 034dd2f..8e5154a 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -957,11 +957,6 @@ main (int argc, char *argv[])
>  		exit(RTVL_FAIL);
>  	}
>  
> -	if (check_alias_settings(conf)) {
> -		fprintf(stderr, "fatal configuration error, aborting");
> -		exit(RTVL_FAIL);
> -	}
> -
>  	if (optind < argc) {
>  		dev = calloc(1, FILE_NAME_SIZE);
>  
> @@ -988,20 +983,9 @@ main (int argc, char *argv[])
>  
>  	libmp_udev_set_sync_support(1);
>  
> -	if (init_checkers()) {
> -		condlog(0, "failed to initialize checkers");
> -		goto out;
> -	}
> -	if (init_prio()) {
> -		condlog(0, "failed to initialize prioritizers");
> -		goto out;
> -	}
> -
>  	if ((cmd == CMD_LIST_SHORT || cmd == CMD_LIST_LONG) && enable_foreign)
>  		conf->enable_foreign = strdup("");
>  
> -	/* Failing here is non-fatal */
> -	init_foreign(conf->enable_foreign);
>  	if (cmd == CMD_USABLE_PATHS) {
>  		r = check_usable_paths(conf, dev, dev_type) ?
>  			RTVL_FAIL : RTVL_OK;
> @@ -1036,6 +1020,23 @@ main (int argc, char *argv[])
>  		break;
>  	}
>  
> +	if (check_alias_settings(conf)) {
> +		fprintf(stderr, "fatal configuration error, aborting");
> +		exit(RTVL_FAIL);
> +	}
> +
> +	if (init_checkers()) {
> +		condlog(0, "failed to initialize checkers");
> +		goto out;
> +	}
> +	if (init_prio()) {
> +		condlog(0, "failed to initialize prioritizers");
> +		goto out;
> +	}
> +
> +	/* Failing here is non-fatal */
> +	init_foreign(conf->enable_foreign);
> +
>  	if (cmd == CMD_RESET_WWIDS) {
>  		struct multipath * mpp;
>  		int i;
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

