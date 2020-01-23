Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D40E414666A
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 12:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579778019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PdmlWMqlKQW+azB0tfj3jhPgPNsvZs9LPvvRBPZ0z4Y=;
	b=FI4Da3LkhBIXJbp39eiE5Up8I1StDFWvFUv/3A4Jw/Z/vf3ugnunkvExhBsUd2P9ANwyWX
	oQVmnv3Tydc3cJ11GhYXdqMmq01sR8gEH7Y9tk4EvRP5eocVf9fYJvlT05txR5eph7+XbD
	m4RgTDQQfMLO9waINShTi3r1fh0JEls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-N36KnT1qMuyLcN_pq81uLg-1; Thu, 23 Jan 2020 06:13:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B7D10120B2;
	Thu, 23 Jan 2020 11:13:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F0E1CB;
	Thu, 23 Jan 2020 11:13:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01BEA18089C8;
	Thu, 23 Jan 2020 11:13:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00N9XGXB018071 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 04:33:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06983109941; Thu, 23 Jan 2020 09:33:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F4142109948
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 09:33:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E997986747C
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 09:33:13 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-Ozw2O7ZAN7iyqfEyQzFA5g-1; Thu, 23 Jan 2020 04:33:12 -0500
Received: from [154.119.55.242] (helo=canonical.com)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <stefan.bader@canonical.com>)
	id 1iuYc0-00076J-FJ; Thu, 23 Jan 2020 09:17:18 +0000
From: Stefan Bader <stefan.bader@canonical.com>
To: linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Thu, 23 Jan 2020 11:17:12 +0200
Message-Id: <20200123091713.12623-1-stefan.bader@canonical.com>
X-MC-Unique: Ozw2O7ZAN7iyqfEyQzFA5g-1
X-MC-Unique: N36KnT1qMuyLcN_pq81uLg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00N9XGXB018071
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jan 2020 06:13:07 -0500
Cc: Jens Axboe <axboe@kernel.dk>, Tyler Hicks <tyler.hicks@canonical.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 0/1] Handle NULL make_request_fn in
	generic_make_request()
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In ff36ab34583a "dm: remove request-based logic from make_request_fn wrapper",
device creation became a 2 stage process. In the first stage, the block
device is created which has a queue set up but no mapping function set.
This is done in the second stage, when the mapping table is supplied. At
that stage the device can become either multi-queue/request based or
doing the mapping on the bio level.

So right now, it is possible to crash the kernel by doing a
- dmsetup create --notable <name>
- mount /dev/dm-<minor> <somewhere>

While this may also need to be some fixing up in the device-
mapper codebase, it also should be handled from the block core as
allocating a queue can potentially be done separate from assigning a
mapping function.
There is already one check for not having set up a queue for a device,
so this just adds an additional check for make_request_fn being unset
before trying to further submit the requests.

-Stefan

Stefan Bader (1):
  blk/core: Gracefully handle unset make_request_fn

 block/blk-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.17.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

