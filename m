Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A9412209C4
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 16:32:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97BE7300180C;
	Thu, 16 May 2019 14:32:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246D55D717;
	Thu, 16 May 2019 14:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E83DF19725;
	Thu, 16 May 2019 14:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GEWGBL023328 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 10:32:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CC6E608D0; Thu, 16 May 2019 14:32:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5EB460851;
	Thu, 16 May 2019 14:32:11 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85DAB30832E6;
	Thu, 16 May 2019 14:32:10 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id m32so4181074qtf.0;
	Thu, 16 May 2019 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=X8Zn0Ao5+NlF3rVXz5zRXX+lJ34YqVoy4hz0BMVmeC0=;
	b=kw/dPt/T0pFLManSsIA+MRgz7dLyswMCxpBoBK6RYP9TvbnG5+dEWXmlhahmnMy8pf
	oal8VfF2Cj877boI8J/Oz53sQ+abDDRqZT5AjZbdS9HwIox56NEeuv1PqGU/Q/nzyir9
	Lf/0HccQm8QbtwuvqF449FcOkCxlzy4bMfwaP3/q9D1pFARDKTFdhQoIcDih9Ke6OpmC
	km2WPwv2B3AqKW945SIS+TJkDnstb3cnixDMCRKsyQwvcMngSQTkmhmTmn7EBl/annym
	Ycoml7ZPSyl6pl1K3+uZs+mxroTzsxOL6MjPSpRPHjjcwM03pT8BAtivSAyXFt8oI5ns
	Fbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=X8Zn0Ao5+NlF3rVXz5zRXX+lJ34YqVoy4hz0BMVmeC0=;
	b=GyAL8HzsS7HCL22LAdNDcGsxNXBlKCg30JfnmLYFe4NvhCcCWFvTcFvEXfHoxsRX2f
	QYdGTJ0E5vrRLXDux4l1pvjjB02gStdh+a1Be31EsIGdFQ6+LE3HtgpdoE+CsKlX5GBh
	SM+MirV8TcCk7PiUWMkmYXOKwyr8u6FMqJIMfhEiQUHfSTAZEGIRPz3LzClexcSZQPBO
	xdecp/spgPpBwjylNMSPInALljurCndzY8+FHYQ1RamH8QW2Ix8t+LNQvDiAcskbpAtv
	yInC10utCsXyIhKeuljJOnqKJ0VM1CIYCENukn/emlWQb8nAip0l7xUNzVha1qnjpFE3
	EheA==
X-Gm-Message-State: APjAAAUsDjrZFwG+gRxz9TYU0fb+wPS344hrPZDcyfMzuZVKF0NXBfVg
	PYNqkALndTEpUYWA9msfeVE=
X-Google-Smtp-Source: APXvYqwqbyY/Biluv92FiPwVOXOXCbK63r67F7rPvK2jDDYHhUK5972NbxA1J46u+agIWydR7P4rjQ==
X-Received: by 2002:a0c:b64c:: with SMTP id q12mr40943352qvf.50.1558017129220; 
	Thu, 16 May 2019 07:32:09 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	y13sm4119292qtc.21.2019.05.16.07.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 07:32:07 -0700 (PDT)
Date: Thu, 16 May 2019 10:32:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190516143206.GA16368@lobo>
References: <20190513185948.GA26710@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513185948.GA26710@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 16 May 2019 14:32:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 16 May 2019 14:32:10 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.006  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, YueHaibing <yuehaibing@huawei.com>,
	Mike Snitzer <snitzer@redhat.com>, Huaisheng Ye <yehs1@lenovo.com>,
	Nikos Tsironis <ntsironis@arrikto.com>, Peng Wang <rocking@whu.edu.cn>,
	Helen Koike <helen.koike@collabora.com>,
	Martin Wilck <mwilck@suse.com>, linux-block@vger.kernel.org,
	Milan Broz <gmazyland@gmail.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Sheetal Singala <2396sheetal@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	Yufen Yu <yuyufen@huawei.com>, Christoph Hellwig <hch@lst.de>,
	Alasdair G Kergon <agk@redhat.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [git pull v2] device mapper changes for 5.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 16 May 2019 14:32:41 +0000 (UTC)

Hi Linus,

Seems you haven't pulled my 'for-5.2/dm-changes' tag from earlier this
week so I've added 4 additional simple commits to this v2 pull.

(Last commit being trivial janitor patch but I'm being hen-pecked about
it by the author on LKML so figured I'd include it while getting you the
3 additional substantive fixes).

The following changes since commit dc4060a5dc2557e6b5aa813bf5b73677299d62d2:

  Linux 5.1-rc5 (2019-04-14 15:17:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.2/dm-changes-v2

for you to fetch changes up to 8454fca4f53bbe5e0a71613192674c8ce5c52318:

  dm: fix a couple brace coding style issues (2019-05-16 10:09:21 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Improve DM snapshot target's scalability by using finer grained
  locking.  Requires some list_bl interface improvements.

- Add ability for DM integrity to use a bitmap mode, that tracks regions
  where data and metadata are out of sync, instead of using a journal.

- Improve DM thin provisioning target to not write metadata changes to
  disk if the thin-pool and associated thin devices are merely
  activated but not used.  This avoids metadata corruption due to
  concurrent activation of thin devices across different OS instances
  (e.g. split brain scenarios, which ultimately would be avoided if
  proper device filters were used -- but not having proper filtering has
  proven a very common configuration mistake)

- Fix missing call to path selector type->end_io in DM multipath.  This
  fixes reported performance problems due to inaccurate path selector IO
  accounting causing an imbalance of IO (e.g. avoiding issuing IO to
  particular path due to it seemingly being heavily used).

- Fix bug in DM cache metadata's loading of its discard bitset that
  could lead to all cache blocks being discarded if the very first cache
  block was discarded (thankfully in practice the first cache block is
  generally in use; be it FS superblock, partition table, disk label,
  etc).

- Add testing-only DM dust target which simulates a device that has
  failing sectors and/or read failures.

- Fix a DM init error path reference count hang that caused boot hangs
  if user supplied malformed input on kernel commandline.

- Fix a couple issues with DM crypt target's logging being overly
  verbose or lacking context.

- Various other small fixes to DM init, DM multipath, DM zoned, and DM
  crypt.

----------------------------------------------------------------
Bryan Gurney (1):
      dm: add dust target

Christoph Hellwig (1):
      dm crypt: fix endianness annotations around org_sector_of_dmreq

Colin Ian King (1):
      dm dust: remove redundant unsigned comparison to less than zero

Damien Le Moal (1):
      dm zoned: Fix zone report handling

Dan Carpenter (1):
      dm zoned: Silence a static checker warning

Helen Koike (2):
      dm init: fix max devices/targets checks
      dm ioctl: fix hang in early create error condition

Huaisheng Ye (3):
      dm writecache: remove needless dereferences in __writecache_writeback_pmem()
      dm writecache: add unlikely for returned value of rb_next/prev
      dm writecache: remove unused member page_offset in writeback_struct

Martin Wilck (1):
      dm mpath: always free attached_handler_name in parse_path()

Mike Snitzer (5):
      dm space map common: zero entire ll_disk
      dm thin metadata: check __commit_transaction()'s return
      dm thin metadata: add wrappers for managing write locking of metadata
      dm thin metadata: do not write metadata if no changes occurred
      dm integrity: whitespace, coding style and dead code cleanup

Mikulas Patocka (13):
      dm delay: fix a crash when invalid device is specified
      dm writecache: avoid unnecessary lookups in writecache_find_entry()
      dm integrity: correctly calculate the size of metadata area
      dm integrity: don't check null pointer before kvfree and vfree
      dm integrity: don't report unused options
      dm integrity: update documentation
      dm integrity: introduce rw_journal_sectors()
      dm ingerity: pass size to dm_integrity_alloc_page_list()
      dm integrity: allow large ranges to be described
      dm integrity: introduce a function add_new_range_and_wait()
      dm integrity: add a bitmap mode
      dm integrity: handle machine reboot in bitmap mode
      dm integrity: implement synchronous mode for reboot handling

Milan Broz (2):
      dm crypt: move detailed message into debug level
      dm crypt: print device name in integrity error message

Nikos Tsironis (7):
      dm cache metadata: Fix loading discard bitset
      list: Don't use WRITE_ONCE() in hlist_add_behind()
      list_bl: Add hlist_bl_add_before/behind helpers
      dm snapshot: Don't sleep holding the snapshot lock
      dm snapshot: Replace mutex with rw semaphore
      dm snapshot: Make exception tables scalable
      dm snapshot: Use fine-grained locking scheme

Peng Wang (1):
      dm: only initialize md->dax_dev if CONFIG_DAX_DRIVER is enabled

Sheetal Singala (1):
      dm: fix a couple brace coding style issues

YueHaibing (1):
      dm dust: Make dm_dust_init and dm_dust_exit static

Yufen Yu (1):
      dm mpath: fix missing call of path selector type->end_io

 Documentation/device-mapper/dm-dust.txt          | 272 +++++++++
 Documentation/device-mapper/dm-integrity.txt     |  32 +-
 drivers/md/Kconfig                               |   9 +
 drivers/md/Makefile                              |   1 +
 drivers/md/dm-cache-metadata.c                   |   9 +-
 drivers/md/dm-crypt.c                            |  26 +-
 drivers/md/dm-delay.c                            |   3 +-
 drivers/md/dm-dust.c                             | 515 ++++++++++++++++
 drivers/md/dm-exception-store.h                  |   3 +-
 drivers/md/dm-init.c                             |   8 +-
 drivers/md/dm-integrity.c                        | 717 ++++++++++++++++++++---
 drivers/md/dm-ioctl.c                            |   6 +-
 drivers/md/dm-mpath.c                            |  19 +-
 drivers/md/dm-rq.c                               |   8 +-
 drivers/md/dm-snap.c                             | 359 ++++++++----
 drivers/md/dm-target.c                           |   3 +-
 drivers/md/dm-thin-metadata.c                    | 139 +++--
 drivers/md/dm-writecache.c                       |  29 +-
 drivers/md/dm-zoned-metadata.c                   |   5 +
 drivers/md/dm-zoned-target.c                     |   3 +-
 drivers/md/dm.c                                  |  12 +-
 drivers/md/persistent-data/dm-space-map-common.c |   2 +
 include/linux/device-mapper.h                    |   3 +-
 include/linux/list.h                             |   2 +-
 include/linux/list_bl.h                          |  26 +
 25 files changed, 1915 insertions(+), 296 deletions(-)
 create mode 100644 Documentation/device-mapper/dm-dust.txt
 create mode 100644 drivers/md/dm-dust.c

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
