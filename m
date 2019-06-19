Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39C4C83F
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 09:22:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F915306E61C;
	Thu, 20 Jun 2019 07:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F067419C4F;
	Thu, 20 Jun 2019 07:22:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E76F0206D4;
	Thu, 20 Jun 2019 07:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J83tYO006777 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 04:03:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AEA05C225; Wed, 19 Jun 2019 08:03:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064935C221
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:52 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94C5B305D46D
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 29E8EAF55;
	Wed, 19 Jun 2019 08:03:18 +0000 (UTC)
From: Qu Wenruo <wqu@suse.com>
To: dm-devel@redhat.com
Date: Wed, 19 Jun 2019 16:03:10 +0800
Message-Id: <20190619080312.11549-1-wqu@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 19 Jun 2019 08:03:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 19 Jun 2019 08:03:37 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'wqu@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <wqu@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Jun 2019 03:21:43 -0400
Cc: linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 0/2] dm log writes: Add support for filter bios
	based on its type
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 20 Jun 2019 07:22:19 +0000 (UTC)

Current dm-log-writes will record all bios, no matter if the bios is
METADATA (normally what we care) or is DATA (normally we cares less for
the log-replay context).

This causes a lot of extra space required for log device. E.g write 10M,
sync, overwrite that 10M file, this would cause over 20M for log device
just for the data.

This patchset introduces two way to specify the dump type:
- dump_type=%s optional option for constructor
  The default dump_type is ALL, thus no behavior change.

- dump_type=%s message type to change type on the fly

Also to cooperate the new dump_type= option, always output the dump_type
for STATUSTYPE_TABLE.

A common use case would be:
 # dmsetup create log --table 0 $(blockdev --getsz $dev) log-writes $dev $log_dev
 # mkfs.btrfs -f /dev/mapper/log
 # dmsetup suspend log
 # dmsetup message log 0 dump_type=METADATA|FUA|FLUSH|DISCARD|MARK
 # dmsetup resume log
 # mount /dev/mapper/log <mnt>
 # <do some work load>
 # umount <mnt>
 # dmsetup remove log
 # <replay>

Now the log device will not record data writes, thus hugely reduce the
space requirement for log device, allowing more operations to be down
before hitting the space limit.

Currently btrfs check doesn't check data checksum by default, thus even
we have wrong data on-disk, we should be fine checking the metadata.

I'm not 100% sure if this applies to other filesystems, but as long as
metadata writes is marked correctly, other filesystems can also benifit
from this feature.

Qu Wenruo (2):
  dm log writes: Allow dm-log-writes to filter bios based on types to
    reduce log device space usage
  dm log writes: Introduce dump_type= message type to change dump_type
    on the fly

 drivers/md/dm-log-writes.c | 177 ++++++++++++++++++++++++++++++++++---
 1 file changed, 167 insertions(+), 10 deletions(-)

-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
