Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03B380675
	for <lists+dm-devel@lfdr.de>; Fri, 14 May 2021 11:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620985522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TppqU1NAaFj4p5YYwXR6Q0RpNOtJEcyOU63MNOR0lIk=;
	b=SwBW6n+BdX/Z8ae5gwiervG1kphBYwk4SqXIb9/LH7PezQ2lCNQLuwwm7d5/36oHBv0O9W
	7Za55c4J4Vqb20Ful18uXywkMQBRMohUMWGeETWkQyz9xhkVYip0XLB5/cNfMCMQKHp14a
	IdU3+hW+Zxs142NCLw+HWyDlyz07LM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-kJxw-JiTP7-t_Yc-NVQ0hw-1; Fri, 14 May 2021 05:45:19 -0400
X-MC-Unique: kJxw-JiTP7-t_Yc-NVQ0hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA3C8015F5;
	Fri, 14 May 2021 09:45:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C241000329;
	Fri, 14 May 2021 09:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 879EE1800B8A;
	Fri, 14 May 2021 09:45:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14E9hoVx022349 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 05:43:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E8021050A; Fri, 14 May 2021 09:43:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A507F1971B;
	Fri, 14 May 2021 09:43:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 14E9hd7S022799; Fri, 14 May 2021 05:43:39 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 14E9haED022795; Fri, 14 May 2021 05:43:36 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 14 May 2021 05:43:36 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <fdee795d-7a4b-9506-b9ca-359b9bcbec34@acm.org>
Message-ID: <alpine.LRH.2.02.2105140514560.20018@file01.intranet.prod.int.rdu2.redhat.com>
References: <a01ab479-69e8-9395-7d24-9de1eec28aff@acm.org>
	<0e7b0b6e-e78c-f22d-af8d-d7bdcb597bea@gmail.com>
	<alpine.LRH.2.02.2105131510330.21927@file01.intranet.prod.int.rdu2.redhat.com>
	<fdee795d-7a4b-9506-b9ca-359b9bcbec34@acm.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, ming.lei@redhat.com, Theodore Ts'o <tytso@mit.edu>,
	bgoncalv@redhat.com, dm-crypt@saout.de, yi.zhang@redhat.com,
	linux-kernel@vger.kernel.org, alex_y_xu@yahoo.ca, hch@lst.de,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	Changheun Lee <nanich.lee@samsung.com>, jaegeuk@kernel.org,
	linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] regression: data corruption with ext4 on LUKS on
 nvme with torvalds master
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 13 May 2021, Bart Van Assche wrote:

> On 5/13/21 12:22 PM, Mikulas Patocka wrote:
> > We already had problems with too large bios in dm-crypt and we fixed it by 
> > adding this piece of code:
> > 
> >         /*
> >          * Check if bio is too large, split as needed.
> >          */
> >         if (unlikely(bio->bi_iter.bi_size > (BIO_MAX_VECS << PAGE_SHIFT)) &&
> >             (bio_data_dir(bio) == WRITE || cc->on_disk_tag_size))
> >                 dm_accept_partial_bio(bio, ((BIO_MAX_VECS << PAGE_SHIFT) >> SECTOR_SHIFT));
> > 
> > It will ask the device mapper to split the bio if it is too large. So, 
> > crypt_alloc_buffer can't receive a bio that is larger than BIO_MAX_VECS << 
> > PAGE_SHIFT.
> 
> Hi Mikulas,
> 
> Are you perhaps referring to commit 4e870e948fba ("dm crypt: fix error
> with too large bios")? Did that commit go upstream before multi-page
> bvec support?

Yes. It's from 2016.

> Can larger bios be supported in case of two or more
> contiguous pages now that multi-page bvec support is upstream?

No - we need to allocate a buffer for the written data. The buffer size is 
limited to PAGE_SIZE * BIO_MAX_VECS.

> Thanks,
> 
> Bart.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

