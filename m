Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5311C9D18
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 23:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588886359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZAn3sRKlcL4blF1e2VFvX9LgId42whd4f8vFERV0PH4=;
	b=hbTr/z0xnUxf2PX2SEmW3o+kFEekdtJ7SeHxYRHoFgkxPybnJBzKUS/tE6Z8nxvUECmu73
	MOP/YY+9tq9AUT74jkkaOmwdnOtM0g4cdaA7iD1wSQupxTeahQdZKcpnad0JaWcSUR/ATp
	1ezabjq9Sc4FsdfR+xRm8QMj7oAteXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-sWs3VurRMdinQkLsJHv7cw-1; Thu, 07 May 2020 17:19:17 -0400
X-MC-Unique: sWs3VurRMdinQkLsJHv7cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7DF1005510;
	Thu,  7 May 2020 21:19:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4936D6109E;
	Thu,  7 May 2020 21:19:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CB921809542;
	Thu,  7 May 2020 21:19:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047LIxqW026147 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 17:18:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85C781182EA; Thu,  7 May 2020 21:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 817171182E9
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 229E11019CB4
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:18:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-9FlXkaKBPRCLedx04yXggg-1;
	Thu, 07 May 2020 17:18:54 -0400
X-MC-Unique: 9FlXkaKBPRCLedx04yXggg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2BFBBAC2C;
	Thu,  7 May 2020 21:18:55 +0000 (UTC)
Message-ID: <8c24a3e1f995605b3ed3df2c768b0053766cd5a0.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christian Hesse <list@eworm.de>, dm-devel@redhat.com
Date: Thu, 07 May 2020 23:18:51 +0200
In-Reply-To: <20200506073548.41756-1-list@eworm.de>
References: <20200506073548.41756-1-list@eworm.de>
User-Agent: Evolution 3.36.2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047LIxqW026147
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: Re: [dm-devel] [PATCH 1/2] libmpathpersist: depend on libmultipath
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-06 at 09:35 +0200, Christian Hesse wrote:
> From: Christian Hesse <mail@eworm.de>
> 
> Without this the build fails with:
> 
> /usr/bin/ld: cannot find -lmultipath

Thank you. Strange, I've built multipath thousands of times and never
hit this error. 

> 
> Signed-off-by: Christian Hesse <mail@eworm.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 1dee3680..ba1d73ba 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -28,7 +28,7 @@ all:	$(BUILDDIRS)
>  $(BUILDDIRS):
>  	$(MAKE) -C $@
>  
> -multipath multipathd mpathpersist: libmultipath
> +libmpathpersist multipath multipathd mpathpersist: libmultipath
>  mpathpersist:  libmpathpersist

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

