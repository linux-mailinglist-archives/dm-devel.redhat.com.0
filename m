Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B3A34211060
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 18:15:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-3rzo9ZGQO7OdpRpxpI833Q-1; Wed, 01 Jul 2020 12:15:34 -0400
X-MC-Unique: 3rzo9ZGQO7OdpRpxpI833Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 590CD106B249;
	Wed,  1 Jul 2020 16:15:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0C3910013C0;
	Wed,  1 Jul 2020 16:15:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C1DD6C9C6;
	Wed,  1 Jul 2020 16:15:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061G8Yem003933 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 12:08:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1897E207AC6C; Wed,  1 Jul 2020 16:08:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 135F1205EA88
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 16:08:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D5C1859173
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 16:08:31 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-JdZBnI5nMMKIqQCx-nH9zw-1; Wed, 01 Jul 2020 12:08:29 -0400
X-MC-Unique: JdZBnI5nMMKIqQCx-nH9zw-1
Received: by mail-ed1-f67.google.com with SMTP id b15so20457911edy.7
	for <dm-devel@redhat.com>; Wed, 01 Jul 2020 09:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NgtGRFNzMUt8UwQnpVLH6Q0lK3Q/pmzbcISwUTSvZp4=;
	b=PX3prBhpGFZoMdWQcbWCAvN4GLrPYjn7ML2W3FVG56JOR9D9Byvt2yJilOw4F6duAZ
	fcWQWEEgseA/yriVb03zhquBIRi5Bf4+2pExVG+j0JaP/RawgE674zA1DYMQaQowgDbQ
	tA/nalKRxZAAXYUqzBEBiEEPncQL5cimJKMNcQSyHGknWTmLV1RFVyr3DxmlWXePOdZt
	cTfU9S14WIUjwdegfdr9AcEB1GCRx2qI0IIjbQlQ94m7cCEiXflM+wmpQc37pss7sUgl
	4kp4Ucc8eztmd5TrNXSiqDJ/sM8hepgWGyHaOHPHB0wex/YTnMnV1WQ88RFtxknxXP3D
	HHtw==
X-Gm-Message-State: AOAM532NVtiRkgHqhVHaHWP2KWQKjXvfA+mqdEncpBA8IZNxydi32Lfo
	wEjunU7sPMfXaVjWSwcc3FcddrAEbUk6Q57347gJ0Q==
X-Google-Smtp-Source: ABdhPJwTtEaJeqUJmjVrnga0zb3T87bQXg/qHVHNHjeT7uurwTRSLAeKnsyE6dqNxhAJ1jQ5OrZ9KB+p0GzE9WKAsFg=
X-Received: by 2002:a05:6402:21c2:: with SMTP id
	bi2mr29609575edb.296.1593619707927; 
	Wed, 01 Jul 2020 09:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
	<20200701085947.3354405-17-hch@lst.de>
In-Reply-To: <20200701085947.3354405-17-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Jul 2020 09:08:17 -0700
Message-ID: <CAPcyv4hELsX=dnqppbL72Tg2k8xMm-5ZaEsxM98eQ7XPoG5NGg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org, linux-raid <linux-raid@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [dm-devel] [PATCH 16/20] block: move ->make_request_fn to
	struct block_device_operations
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 1, 2020 at 2:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The make_request_fn is a little weird in that it sits directly in
> struct request_queue instead of an operation vector.  Replace it with
> a block_device_operations method called submit_bio (which describes much
> better what it does).  Also remove the request_queue argument to it, as
> the queue can be derived pretty trivially from the bio.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[..]
>  drivers/nvdimm/blk.c                          |  5 +-
>  drivers/nvdimm/btt.c                          |  5 +-
>  drivers/nvdimm/pmem.c                         |  5 +-

For drivers/nvdimm

Acked-by: Dan Williams <dan.j.williams@intel.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

