Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1545855BF3C
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jun 2022 09:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656402589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eJ3gOvNgnVVFku8AsbiJf8NvHQwbVrXr5fpRao9k7Z0=;
	b=QfC8ht2wgPCgSD21iPtUTFRUEPM1qVu7RDokNWjE6hWWR+hBBgN1VsFFfoUhiDlIgXwxQd
	FC6k0QNYzO5U5d5tgZoUpRqy5XlJANIO3msJP+zZtm1D9+pwJ3LmxDE+GpXWijdzOLBT7A
	wpEkdqsY50y/A31h3XB7a/+d17guUiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-4skQOxQOO2yVNPQrH0h_XQ-1; Tue, 28 Jun 2022 03:49:45 -0400
X-MC-Unique: 4skQOxQOO2yVNPQrH0h_XQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1FFA893E6D;
	Tue, 28 Jun 2022 07:49:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEACE492CA3;
	Tue, 28 Jun 2022 07:49:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 424DA1947052;
	Tue, 28 Jun 2022 07:49:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13A63194704E
 for <dm-devel@listman.corp.redhat.com>; Tue, 28 Jun 2022 07:49:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2CD240C1289; Tue, 28 Jun 2022 07:49:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-29.pek2.redhat.com [10.72.8.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 117244050C54;
 Tue, 28 Jun 2022 07:49:33 +0000 (UTC)
Date: Tue, 28 Jun 2022 15:49:28 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Kent Overstreet <kent.overstreet@gmail.com>
Message-ID: <YrqyiCcnvPCqsn8F@T590>
References: <20220624141255.2461148-1-ming.lei@redhat.com>
 <20220624141255.2461148-2-ming.lei@redhat.com>
 <20220626201458.ytn4mrix2pobm2mb@moria.home.lan>
 <Yrld9rLPY6L3MhlZ@T590>
 <20220628042610.wuittagsycyl4uwa@moria.home.lan>
MIME-Version: 1.0
In-Reply-To: <20220628042610.wuittagsycyl4uwa@moria.home.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH 5.20 1/4] block: add bio_rewind() API
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, Eric Biggers <ebiggers@google.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Dmitry Monakhov <dmonakhov@openvz.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 28, 2022 at 12:26:10AM -0400, Kent Overstreet wrote:
> On Mon, Jun 27, 2022 at 03:36:22PM +0800, Ming Lei wrote:
> > Not mention bio_iter, bvec_iter has been 32 bytes, which is too big to
> > hold in per-io data structure. With this patch, 8bytes is enough
> > to rewind one bio if the end sector is fixed.
> 
> And with rewind, you're making an assumption about the state the iterator is
> going to be in when the IO has completed.
> 
> What if the iterator was never advanced?

bio_rewind() works as expected if the iterator doesn't advance, since bytes
between the recorded position and the end position isn't changed, same
with the end position.

> 
> So say you check for that by saving some other part of the iterator - but that
> may have legitimately changed too, if the bio was redirected (bi_sector changes)
> or trimmed (bi_size changes)
> 
> I still think this is an inherently buggy interface, the way it's being proposed
> to be used.

The patch did mention that the interface should be for situation in which end
sector of bio won't change.


Thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

