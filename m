Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 04174B0BBD
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 11:43:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C427B10DCC80;
	Thu, 12 Sep 2019 09:43:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D8B600C4;
	Thu, 12 Sep 2019 09:43:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 119122551C;
	Thu, 12 Sep 2019 09:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C7Ur7E021557 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 03:30:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C15FC60167; Thu, 12 Sep 2019 07:30:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5CFD600C4;
	Thu, 12 Sep 2019 07:30:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B84E13018761;
	Thu, 12 Sep 2019 07:30:45 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1A2B520CC7;
	Thu, 12 Sep 2019 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568273445;
	bh=/4FFg4V9Dw7gfO91ycK9E3A5BotunSngO5z+vqD/Ets=;
	h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
	b=qWJ+acnEHomkZti/bnkK3mP+tBUkufK96aIeccKIIc8iPtzzYydCKEc0VezWnQ+Sg
	63YpL0XV5jHpoov5/8vBxnx33tdYwpGkELeOd2/1sfDEuscMkfgT5LS6k0Wr2o2jAF
	AUPNkbIWZXx1cDWZ8JvOF2R4JTMVErdIposXvSSg=
Date: Thu, 12 Sep 2019 07:30:44 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
In-Reply-To: <20190911113133.837-1-ming.lei@redhat.com>
References: <20190911113133.837-1-ming.lei@redhat.com>
Message-Id: <20190912073045.1A2B520CC7@mail.kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 12 Sep 2019 07:30:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 12 Sep 2019 07:30:45 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 12 Sep 2019 05:42:27 -0400
Cc: stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH V2] dm-raid: fix updating of
	max_discard_sectors limit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 12 Sep 2019 09:43:21 +0000 (UTC)

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.2.14, v4.19.72, v4.14.143, v4.9.192, v4.4.192.

v5.2.14: Build OK!
v4.19.72: Failed to apply! Possible dependencies:
    53b471687012 ("dm: remove indirect calls from __send_changing_extent_only()")
    61697a6abd24 ("dm: eliminate 'split_discard_bios' flag from DM target interface")

v4.14.143: Failed to apply! Possible dependencies:
    00716545c894 ("dm: add support for secure erase forwarding")
    0519c71e8d46 ("dm: backfill abnormal IO support to non-splitting IO submission")
    0776aa0e30aa ("dm: ensure bio-based DM's bioset and io_pool support targets' maximum IOs")
    18a25da84354 ("dm: ensure bio submission follows a depth-first tree walk")
    318716ddea08 ("dm: safely allocate multiple bioset bios")
    3d7f45625a84 ("dm: fix __send_changing_extent_only() to send first bio and chain remainder")
    53b471687012 ("dm: remove indirect calls from __send_changing_extent_only()")
    552aa679f265 ("dm raid: use rs_is_raid*()")
    61697a6abd24 ("dm: eliminate 'split_discard_bios' flag from DM target interface")
    64f52b0e3148 ("dm: improve performance by moving dm_io structure to per-bio-data")
    745dc570b2c3 ("dm: rename 'bio' member of dm_io structure to 'orig_bio'")
    978e51ba38e0 ("dm: optimize bio-based NVMe IO submission")
    f31c21e4365c ("dm: remove unused 'num_write_bios' target interface")

v4.9.192: Failed to apply! Possible dependencies:
    124d6db07c3b ("nbd: use our own workqueue for recv threads")
    19372e276917 ("loop: implement REQ_OP_WRITE_ZEROES")
    3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
    48920ff2a5a9 ("block: remove the discard_zeroes_data flag")
    552aa679f265 ("dm raid: use rs_is_raid*()")
    61697a6abd24 ("dm: eliminate 'split_discard_bios' flag from DM target interface")
    7ab84db64f11 ("dm integrity: improve the Kconfig help text for DM_INTEGRITY")
    9561a7ade0c2 ("nbd: add multi-connection support")
    b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")

v4.4.192: Failed to apply! Possible dependencies:
    33e53f06850f ("dm raid: introduce extended superblock and new raid types to support takeover/reshaping")
    4c9971ca6a17 ("dm raid: make sure no feature flags are set in metadata")
    552aa679f265 ("dm raid: use rs_is_raid*()")
    61697a6abd24 ("dm: eliminate 'split_discard_bios' flag from DM target interface")
    676fa5ad6e96 ("dm raid: use rt_is_raid*() in all appropriate checks")
    702108d194e3 ("dm raid: cleanup / provide infrastructure")
    73c6f239a862 ("dm raid: rename variable 'ret' to 'r' to conform to other dm code")
    92c83d79b07e ("dm raid: use dm_arg_set API in constructor")
    f090279eaff8 ("dm raid: check constructor arguments for invalid raid level/argument combinations")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
