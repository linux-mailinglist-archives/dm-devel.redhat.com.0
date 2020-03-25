Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEFF192235
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LHq582pKYkfM0iXrHhHlyVmQVReQkWyebjaGRezImYw=;
	b=LYlUEUuyTxXO5GydIqOFmhhxbdbnl6S7Gt6845WmNRUOPvBrPZqjLXWcpm4ca+yaiDNqDu
	kdfYGv5Ee5osON5j2WpLC7I20MliO8seI1cKNuvvPQVzicGTZAoVpAWfgEujiNywM1gRW3
	/rWsIhkngcmV4RNrbux43qSOsbfr7II=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-_6HdYH1GOYCk3YsqX4C7DA-1; Wed, 25 Mar 2020 04:13:29 -0400
X-MC-Unique: _6HdYH1GOYCk3YsqX4C7DA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6488010CA;
	Wed, 25 Mar 2020 08:13:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD6F60BE0;
	Wed, 25 Mar 2020 08:13:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12B4386387;
	Wed, 25 Mar 2020 08:13:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P123I7013429 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 21:02:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6735520316E0; Wed, 25 Mar 2020 01:02:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6314B20316E9
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 01:02:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC38800296
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 01:02:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-134-DfQW0iSEMRugmyeCH6zLiQ-1;
	Tue, 24 Mar 2020 21:01:58 -0400
X-MC-Unique: DfQW0iSEMRugmyeCH6zLiQ-1
Received: from localhost (unknown [137.135.114.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 62A0220719;
	Wed, 25 Mar 2020 01:01:57 +0000 (UTC)
Date: Wed, 25 Mar 2020 01:01:56 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
In-Reply-To: <20200324132245.27843-1-bob.liu@oracle.com>
References: <20200324132245.27843-1-bob.liu@oracle.com>
Message-Id: <20200325010157.62A0220719@mail.kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P123I7013429
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com, stable@vger.kernel.org
Subject: Re: [dm-devel] [PATCH resend] dm zoned: remove duplicated
	nr_rnd_zones increasement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target").

The bot has tested the following trees: v5.5.11, v5.4.27, v4.19.112, v4.14.174.

v5.5.11: Build OK!
v5.4.27: Failed to apply! Possible dependencies:
    5eac3eb30c9a ("block: Remove partition support for zoned block devices")
    6c1b1da58f8c ("block: add zone open, close and finish operations")
    7fc8fb51a143 ("null_blk: clean up report zones")
    ad512f2023b3 ("scsi: sd_zbc: add zone open, close, and finish support")
    c7a1d926dc40 ("block: Simplify REQ_OP_ZONE_RESET_ALL handling")
    c98c3d09fca4 ("block: cleanup the !zoned case in blk_revalidate_disk_zones")
    ceeb373aa6b9 ("block: Simplify report zones execution")
    d41003513e61 ("block: rework zone reporting")
    d9dd73087a8b ("block: Enhance blk_revalidate_disk_zones()")
    dd85b4922de1 ("null_blk: return fixed zoned reads > write pointer")
    e3f89564c557 ("null_blk: clean up the block device operations")

v4.19.112: Failed to apply! Possible dependencies:
    515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
    5f832a395859 ("scsi: sd_zbc: Fix sd_zbc_check_zones() error checks")
    a2d6b3a2d390 ("block: Improve zone reset execution")
    a91e138022bc ("block: Introduce blkdev_nr_zones() helper")
    bd976e527259 ("block: Kill gfp_t argument of blkdev_report_zones()")
    bf5054569653 ("block: Introduce blk_revalidate_disk_zones()")
    d2e428e49eec ("scsi: sd_zbc: Reduce boot device scan and revalidate time")
    d41003513e61 ("block: rework zone reporting")
    e76239a3748c ("block: add a report_zones method")

v4.14.174: Failed to apply! Possible dependencies:
    08e18eab0c57 ("block: add bi_blkg to the bio for cgroups")
    30e5e929c7bf ("nvme: don't pass struct nvme_ns to nvme_config_discard")
    5238dcf4136f ("block: replace bio->bi_issue_stat with bio-specific type")
    53cfdc10a95d ("blk-throttle: fix null pointer dereference while throttling writeback IOs")
    5d47c89f29ea ("dm: clear all discard attributes in queue_limits when discards are disabled")
    8b904b5b6b58 ("block: Use blk_queue_flag_*() in drivers instead of queue_flag_*()")
    a2d6b3a2d390 ("block: Improve zone reset execution")
    b889bf66d001 ("blk-throttle: track read and write request individually")
    bd976e527259 ("block: Kill gfp_t argument of blkdev_report_zones()")
    bf5054569653 ("block: Introduce blk_revalidate_disk_zones()")
    c8b5fd031a30 ("mmc: block: Factor out mmc_setup_queue()")
    d41003513e61 ("block: rework zone reporting")
    d70675121546 ("block: introduce blk-iolatency io controller")
    e447a0151f7c ("zram: set BDI_CAP_STABLE_WRITES once")
    ed754e5deeb1 ("nvme: track shared namespaces")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

