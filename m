Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D64F1A26
	for <lists+dm-devel@lfdr.de>; Mon,  4 Apr 2022 22:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649104499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MRM8oYKi5hSg1aiVwCZd/tZT9k1zbj7wOm0GwI/2A84=;
	b=LpsP1LIA2xATT8TKpBB7wpszCA28qupwX3sso/1P0SB1i4VxN8JWIaDDfoPlZ936ZgSeuz
	4S3kLiMahhH9LP+U0FrCJ8HlDvDtZBuwX1LHmrKISL2Pgmf8FbW/OrYHV7HKfKQJ1PO2mS
	QnK066nsmkgUrOA38aTuUOpMFxH2YpE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-Tk2z4kGyOWuTG54hXCzMQQ-1; Mon, 04 Apr 2022 16:34:57 -0400
X-MC-Unique: Tk2z4kGyOWuTG54hXCzMQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7200E3C0011C;
	Mon,  4 Apr 2022 20:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 894D8145BF0A;
	Mon,  4 Apr 2022 20:34:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEA3C1940372;
	Mon,  4 Apr 2022 20:34:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17DB119451EF
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Apr 2022 20:34:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC66B416384; Mon,  4 Apr 2022 20:34:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC630413723;
 Mon,  4 Apr 2022 20:34:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 234KYn1D032031;
 Mon, 4 Apr 2022 15:34:49 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 234KYnif032030;
 Mon, 4 Apr 2022 15:34:49 -0500
Date: Mon, 4 Apr 2022 15:34:49 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220404203449.GA24684@octiron.msp.redhat.com>
References: <20220404170457.16021-1-mwilck@suse.com>
 <20220404170457.16021-15-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220404170457.16021-15-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v2 14/15] libmultipath: apply_format():
 prevent buffer overflow
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

 On Mon, Apr 04, 2022 at 07:04:56PM +0200, mwilck@suse.com wrote:
> Potential overflow found by coverity (CID 376918).

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/callout.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/callout.c b/libmultipath/callout.c
> index dac088c..57c3481 100644
> --- a/libmultipath/callout.c
> +++ b/libmultipath/callout.c
> @@ -160,7 +160,7 @@ int apply_format(char * string, char * cmd, struct path * pp)
>  	myfree = CALLOUT_MAX_SIZE;
>  
>  	if (!pos) {
> -		strcpy(dst, string);
> +		strlcpy(dst, string, CALLOUT_MAX_SIZE);
>  		return 0;
>  	}
>  
> -- 
> 2.35.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

