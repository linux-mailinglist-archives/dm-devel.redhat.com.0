Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 128451BC6EC
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 19:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588095706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CvlztK4ymYjh6p66KykHSvb6zRr5x1RHoAIf1aJWdWc=;
	b=L59ThJlU3z+NFFcdmmaBq+EezYG7iNNcUoMx+US+pnDDzjvsUNF7iUHvheoEeoinf0gpGe
	R+/g442/hbM+BtTEYLlgIML4QRcxBmgCaj+EWVkw2tW0j+m9BMI5i9Ix5ZLW5jxju9v9av
	XRUpKiApDL4Zi1XJBiUuWmzKx/la0/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-eQ0ahjG_Oom25hCzxZp76g-1; Tue, 28 Apr 2020 13:41:43 -0400
X-MC-Unique: eQ0ahjG_Oom25hCzxZp76g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF857107B0EF;
	Tue, 28 Apr 2020 17:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E4360C81;
	Tue, 28 Apr 2020 17:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4156C1809542;
	Tue, 28 Apr 2020 17:41:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SHbiq7021227 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 13:37:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61E371000322; Tue, 28 Apr 2020 17:37:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 941FE10013BD;
	Tue, 28 Apr 2020 17:37:41 +0000 (UTC)
Date: Tue, 28 Apr 2020 13:37:40 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200428173740.GD17285@redhat.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-14-hare@suse.de>
	<BY5PR04MB6900EA4ACB7303A1D5889C0EE7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900EA4ACB7303A1D5889C0EE7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/13] dm-zoned: metadata version 2
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
Content-Disposition: inline

On Tue, Apr 28 2020 at  6:54am -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
 
> With this, everything works fine for single and dual device case.

Cool.

Hannes, pleasee fold Damien's changes in for v3, thanks!

> But I only did very light testing (formating witth ext4, mounting,
> running simple fio, unmount). I also noticed this message on dmzadm
> --start:
> 
> [ 2707.268812] device-mapper: zoned metadata: (253:0): Using 3233664 B for zone
> information
> [ 2707.921500] device-mapper: zoned metadata: (dmz-sdj): DM-Zoned metadata version 2
> [ 2707.929865] device-mapper: zoned metadata: (dmz-sdj): DM UUID
> 01149f45-1391-d44d-803a-7830d7d62b12
> [ 2707.939457] device-mapper: zoned metadata: (dmz-sdj): DM Label dmz-sdj
> [ 2707.946371] device-mapper: zoned metadata: (nvme1n1): Regular block device
> [ 2707.953616] device-mapper: zoned metadata: (nvme1n1):   uuid
> df2c308c-9c98-1845-afad-6bf80bd0ad4a
> [ 2707.963097] device-mapper: zoned metadata: (nvme1n1):   976773168 512-byte
> logical sectors (offset 0)
> [ 2707.972940] device-mapper: zoned metadata: (nvme1n1):   1864 zones of 524288
> 512-byte logical sectors (offset 0)
> [ 2707.983747] device-mapper: zoned metadata: (sdj): Host-managed zoned block device
> [ 2707.991852] device-mapper: zoned metadata: (sdj):   uuid
> f842e365-53b6-4942-ad00-954e50bec940
> [ 2708.001004] device-mapper: zoned metadata: (sdj):   29297213440 512-byte
> logical sectors (offset 977272832)
> [ 2708.011380] device-mapper: zoned metadata: (sdj):   55880 zones of 524288
> 512-byte logical sectors (offset 1864)
> [ 2708.022184] device-mapper: zoned metadata: (dmz-sdj):   57744 zones of 524288
> 512-byte logical sectors
> [ 2708.032116] device-mapper: zoned metadata: (dmz-sdj):   4 metadata zones
> [ 2708.039212] device-mapper: zoned metadata: (dmz-sdj):   57724 data zones for
> 57724 chunks
> [ 2708.048018] device-mapper: zoned metadata: (dmz-sdj):     2383 random zones
> (2383 unmapped)
> [ 2708.057023] device-mapper: zoned metadata: (dmz-sdj):     55340 sequential
> zones (55340 unmapped)
> [ 2708.066509] device-mapper: zoned metadata: (dmz-sdj):   16 reserved
> sequential data zones
> [ 2708.112529] device-mapper: zoned: (dmz-sdj): Target device: 30264000512
> 512-byte logical sectors (3783000064 blocks)

Not liking how chatty DM zoned metadata has become... can that be
removed and the proper .status updates be provided?  (yes I know zoned
never provided .status but this series should introduce a basic one
early in the series, that should've always been there, and then update
it for v2 metadata).

> [ 2708.125465] device-mapper: table: 253:0: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 2708.142332] device-mapper: table: 253:0: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 2708.159659] device-mapper: table: 253:0: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 2708.176600] device-mapper: table: 253:0: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> 
> Which I think comes from the fact that I mixed a 4Kn SMR drive with a 512B
> sector M.2 NVMe drive. The different sector size seem to generate this. I have
> not dig further yet.

I'd have to dig further myself to understand the disposition of these
messages... if it is born of of 512 vs 4096 I'm missing why the
.iterate_devices isn't properly establishing limits that are compatible
with your combined 512 and 4096 hybrid.. e.g. require 4096 to satisfy
the 4K device's constraints.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

