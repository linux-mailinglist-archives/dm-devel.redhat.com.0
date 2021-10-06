Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1009423F59
	for <lists+dm-devel@lfdr.de>; Wed,  6 Oct 2021 15:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633527125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=14dJOJZpsHObo46bASw27+ia6ZPUu6SN8euB2xE89kM=;
	b=E992tKJrX1fwcwWDP3W1d29Hz98ZXaYCTCd2IbG6L5V3/AP/ODhLHrwU59JbH1Tva+I6eu
	H7Nu77y55dZsK7McQc2WI86rut474meOIxzl42Xc96SYfSYL99JMyNq3A98xNrl3dwoaBF
	5SkWGhIm7RGvUQNCT8wdD/mBvHC5AXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-QXnd8NZ-OH-k1ja_u92P5A-1; Wed, 06 Oct 2021 09:32:02 -0400
X-MC-Unique: QXnd8NZ-OH-k1ja_u92P5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9F7802C94;
	Wed,  6 Oct 2021 13:31:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F239AA29;
	Wed,  6 Oct 2021 13:31:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DD444E58F;
	Wed,  6 Oct 2021 13:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196DOdKm014631 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 09:24:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 316792180130; Wed,  6 Oct 2021 13:24:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 251522180120
	for <dm-devel@redhat.com>; Wed,  6 Oct 2021 13:24:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02DDF18A658F
	for <dm-devel@redhat.com>; Wed,  6 Oct 2021 13:24:39 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-263-IX8FN15lP7Gu3FLHME2fQw-1; Wed, 06 Oct 2021 09:24:37 -0400
X-MC-Unique: IX8FN15lP7Gu3FLHME2fQw-1
Received: by mail-qt1-f198.google.com with SMTP id
	o6-20020a05622a008600b002a6c2fbc853so2228111qtw.16
	for <dm-devel@redhat.com>; Wed, 06 Oct 2021 06:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=PhQKrj6CTy/IMZheSbTjJtRay2DZf3eElNhZxG86YDA=;
	b=s3oTs41mALT23lUV5ycnC0UpiR0hXNevpVNkPBw7JWVpUtiOhLQ2zgtK23Z5GwuiDT
	2dZ0KuqaafmSxGGBJ7ciQGXmMO/HeyVJgwfEj4i5Id8eTEc7hxTwq2isu1VXBR1l+ceW
	ABvdJqSBQUJbOI7jM/gDLa9m3R3BAhsTYJkQGEQHRkCZLnjn2pvB5w6Q6czFkRBjOc1L
	+ffSdtL/tbxWoxKHIPT0GZWCXjzr7kLE4Nl6LoMOc/faaLgX4bGDevBQkGAUQwvQeJQO
	tazUNznf5k+70AO1P227eQD9hPmnQIX1am80Y8u1m0PICoazuyR9Dc+F1gnNbQNQok4c
	6mqQ==
X-Gm-Message-State: AOAM530q1LVEkG4bLwXPoNTcdL8FMM+GMdt8LZkNzXuRt/D1oLHYTsgB
	TY6rYwXSzjbVKjAYzsiwAzGGYskZZ/BgjgTMGbg+MXdkP8vO0krUrYzD2gN02vPIXifTwVd+AEc
	uRBDUTB2Lhwb47g==
X-Received: by 2002:a37:9d16:: with SMTP id g22mr19915882qke.158.1633526676977;
	Wed, 06 Oct 2021 06:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU5K9sLtf2F8/ZVmQbICWiONRseEkHUAhaNdvw8PixzCkidZf3Sgubc2NbR+xRlb/+oJjIrw==
X-Received: by 2002:a37:9d16:: with SMTP id g22mr19915860qke.158.1633526676823;
	Wed, 06 Oct 2021 06:24:36 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id s14sm5011152qtc.9.2021.10.06.06.24.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Oct 2021 06:24:36 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:24:35 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Message-ID: <YV2jk1su5caAZmVP@redhat.com>
References: <20210929163600.52141-1-ebiggers@kernel.org>
	<20210929163600.52141-2-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210929163600.52141-2-ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-scsi@vger.kernel.org,
	linux-mmc@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v4 1/4] blk-crypto-fallback: properly prefix
 function and struct names
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 29 2021 at 12:35P -0400,
Eric Biggers <ebiggers@kernel.org> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> For clarity, avoid using just the "blk_crypto_" prefix for functions and
> structs that are specific to blk-crypto-fallback.  Instead, use
> "blk_crypto_fallback_".  Some places already did this, but others
> didn't.
> 
> This is also a prerequisite for using "struct blk_crypto_keyslot" to
> mean a generic blk-crypto keyslot (which is what it sounds like).
> Rename the fallback one to "struct blk_crypto_fallback_keyslot".
> 
> No change in behavior.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

