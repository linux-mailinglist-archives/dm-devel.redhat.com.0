Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79D393D7AA0
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jul 2021 18:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627402331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JLEZ/L5StYsA9R35ZnKboxHiWOThYz42XnuaN+3DpT0=;
	b=jBsAWl8SLW90g9dHYvt8StI0M15FIwtcPOcvwZAmQcFYF5PXhpYpYS3Z6nQ1m6i8sF2SL/
	zOSvhY1BfVhJKMOZe68MZs6dXWJ9fJuTDD8PmhvVw5fuFGhjsMi/iHRTM4iQBcOx6S1epq
	BX2pyd3U6wUW6+kqisHh9tytPZw/riU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-6Daq6eggP_qn3hmK9vt8VQ-1; Tue, 27 Jul 2021 12:12:09 -0400
X-MC-Unique: 6Daq6eggP_qn3hmK9vt8VQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C6921007B2D;
	Tue, 27 Jul 2021 16:12:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00D7C5C1CF;
	Tue, 27 Jul 2021 16:12:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 162914BB7C;
	Tue, 27 Jul 2021 16:12:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RG6Bla010766 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 12:06:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F235DEE67; Tue, 27 Jul 2021 16:06:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83843DEE70
	for <dm-devel@redhat.com>; Tue, 27 Jul 2021 16:06:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1E45866DF5
	for <dm-devel@redhat.com>; Tue, 27 Jul 2021 16:06:08 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-562-QEWcHSPGN3S0YPIz0in4Ew-1; Tue, 27 Jul 2021 12:06:06 -0400
X-MC-Unique: QEWcHSPGN3S0YPIz0in4Ew-1
Received: by mail-qt1-f199.google.com with SMTP id
	g10-20020ac8768a0000b029023c90fba3dcso6603998qtr.7
	for <dm-devel@redhat.com>; Tue, 27 Jul 2021 09:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=XdHI+sIfRw6QiUfn8IwVhCdtXFeYqXjq3borJurA1MY=;
	b=GjIvU3j1tuGBrBn9SYyFbVORQ2kwuQeg6UBcUj/frFKErNjcvfo6DGTXveD2lQeIrj
	lMiR3Mv/mDYmn3ws6dthNu7CpDtDRA19HYV6Qalh9bKrQ6KqJHgca9OofjCyphtozNAt
	PcnC2Nid2gmT81d4ka2YZNVIoWdKu+wAZZDcnoMzrh6euvs/FSsxIcQXwIvt+4njYznW
	QGAn3TEfBa4K80XZ6Y1lNLSWTiEX2NjhyosfSDkbimaK6Yof8wpunCpDtsVmq6Awm+dU
	LtArWv2bPMThbWUyoWDB6MqnDa6o5ukbuWTEo2edgtDKm369gzrsbI616Fefoj3KnKxI
	plWw==
X-Gm-Message-State: AOAM531JR2LYpQkYHXPj+jQ+UsLk5Dki99uuSBwRPvL8hmce6YpOY6xk
	hHZ+Fgb0Ba8kA4ecY2C7++n1/O8uTzXu5QnvdYMCYSOsmz1JuDwThBSRtgD+c+HS7eanTuenJo+
	N/4ULoyQOIY34rQ==
X-Received: by 2002:ac8:5456:: with SMTP id d22mr20324266qtq.316.1627401966275;
	Tue, 27 Jul 2021 09:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAl6iKK0s39Zc7SHgMqBL7TW4R84gjyaLrNTceBegCY8asLYFYJh514nrrtknh3pNi7IYMIw==
X-Received: by 2002:ac8:5456:: with SMTP id d22mr20324250qtq.316.1627401966104;
	Tue, 27 Jul 2021 09:06:06 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	d11sm1884722qki.40.2021.07.27.09.06.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Jul 2021 09:06:05 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:06:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YQAu7KKyKnCm+tlf@redhat.com>
References: <20210725055458.29008-1-hch@lst.de>
	<20210725055458.29008-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210725055458.29008-5-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/8] block: support delayed holder
	registration
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

On Sun, Jul 25 2021 at  1:54P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> device mapper needs to register holders before it is ready to do I/O.
> Currently it does so by registering the disk early, which has all kinds
> of bad side effects.  Support registering holders on an initialized but
> not registered disk instead by delaying the sysfs registration until the
> disk is registered.

This header starts to shine some light on what is motivating this
series by touching on "all kinds of bad side effects" being fixed.
Any chance you could elaborate what you've noticed/found/hit?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

