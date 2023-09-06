Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5E79466F
	for <lists+dm-devel@lfdr.de>; Thu,  7 Sep 2023 00:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694040303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kuo4hZ7gC0zHW/8u7HTNIUXRRzHShOv+Ks0kZ9V2Y4E=;
	b=CYTUXgjASLmjILzU7D3yJE83lFG9iP7IGsJAcigp9dcv4XKeMoZChb6OwVsujbRj6zoxcL
	6PkZKYGsE3JWmMsdi0FwxMj5FID2niK3DKfT/uqfSIf6j1BSw2J15kox7+Tqp3uDFA0/xS
	5e6lacljZTqzNpAcbg/cpyvTcu+Hbhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-xEnmMGXiPQ6hBM46Mxnk-g-1; Wed, 06 Sep 2023 18:44:53 -0400
X-MC-Unique: xEnmMGXiPQ6hBM46Mxnk-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B21F78279AA;
	Wed,  6 Sep 2023 22:44:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E4342026D76;
	Wed,  6 Sep 2023 22:44:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A6C0194658C;
	Wed,  6 Sep 2023 22:44:50 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3EFAA194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 22:44:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A0F41121318; Wed,  6 Sep 2023 22:44:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08FAC1121314;
 Wed,  6 Sep 2023 22:44:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 386Mid0l028966;
 Wed, 6 Sep 2023 17:44:40 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 386MidAS028965;
 Wed, 6 Sep 2023 17:44:39 -0500
Date: Wed, 6 Sep 2023 17:44:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230906224439.GW7412@octiron.msp.redhat.com>
References: <20230901180235.23980-1-mwilck@suse.com>
 <20230901180235.23980-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230901180235.23980-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 12/21] libmultipath: rename
 fix_bindings_file() to update_bindings_file()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 08:02:25PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We will use this function in a more generic way, give it a more
> generic name.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index 0759643..af2f647 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -606,8 +606,8 @@ static int write_bindings_file(const Bindings *bindings, int fd)
>  	return 0;
>  }
>  
> -static int fix_bindings_file(const struct config *conf,
> -			     const Bindings *bindings)
> +static int update_bindings_file(const struct config *conf,
> +				const Bindings *bindings)
>  {
>  	int rc;
>  	int fd = -1;
> @@ -777,7 +777,7 @@ int check_alias_settings(const struct config *conf)
>  			rc = _check_bindings_file(conf, file, &bindings);
>  			pthread_cleanup_pop(1);
>  			if (rc == -1 && can_write && !conf->bindings_read_only)
> -				rc = fix_bindings_file(conf, &bindings);
> +				rc = update_bindings_file(conf, &bindings);
>  			else if (rc == -1)
>  				condlog(0, "ERROR: bad settings in read-only bindings file %s",
>  					conf->bindings_file);
> -- 
> 2.41.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

