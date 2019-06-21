Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FF503E7
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:44:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AF2C81F25;
	Mon, 24 Jun 2019 07:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5FC919936;
	Mon, 24 Jun 2019 07:44:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A224C1806B1D;
	Mon, 24 Jun 2019 07:44:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LD7vBg014258 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:07:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 190C55D969; Fri, 21 Jun 2019 13:07:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13BE95D962
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:55 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50D683082B67
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 16so5878539ljv.10
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jWa7576rgWVWVSW1745Pn4vugUiYSLxuS7AWMaM+/FQ=;
	b=xoGo+FQp2vZ187gQdSdRprVD4vxPNYjUDtjPAO1IyXa/EuR7uCdQ7DeWaCegKic8As
	isyBoOKpuAuyPKr/2f0AwghYVFts14ArUpmou9WS/9QbyGw6Rf4PQLqF46ydseXryIWF
	JeLm1NkpF4CHvMAlmrNZTAkfkSDvVQe/a7SjPGxUB7eALo4cHbEpWB7G4VdV5qcqry5C
	kfFTS3P81Gy4tv5S+pui7Dz7b7kN0m8pzJlTYVJ5GslUWJyYL8ZRkBVsB6CSahpFg0Z8
	ONGD7t/P4r7+wITdLeBhui0WmxCDiOORu2kzfLfluN6+7PliYReUASKxUO/DrbSNj6Ln
	CHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jWa7576rgWVWVSW1745Pn4vugUiYSLxuS7AWMaM+/FQ=;
	b=osfjNB5OB5+vwFRfDyeDgIty5WVrSh0deC9trGObhoEozM5Qv2SK9vyiVCS1KMd+sA
	nZ0rKOZTqYuxMdc17F9K56X9ozczV0QdR1iZEDghcNUyG4XV/0h55MFOWtpO49NFZucy
	ZQiTiVkg7A4l9JOY52IweritcIk9aIsMzXK5g/uOWTeEGJqnVxKAEEXKV7Wc/vqHXi6O
	rp1Uwl4GCQbL/VbkXhDgsprUD8o5fKNHQNxDM6unaPc6ApYZTOtwy94GQGMeIvXgXhuq
	bve7F/r6XjexE6CJdLyyl+HC1IX0CXQ6wbRfNOjEWHrG/HIuKC9Aji/mde+CGi6mg7qP
	NgbA==
X-Gm-Message-State: APjAAAVEzjGVHBvqevlGrqPZ1gQ/f48V2sV5Ms5p+5LNjSV5IOKkAicB
	lUnl8Ymq77oluZsJADpZex8Jtg==
X-Google-Smtp-Source: APXvYqzUnlkSIRvoWfskQmErTHxIyFPWo4CsYqd4wu3b2Zwd0KoJS6WozUgI1ufyf4P3BJmOuYo4mA==
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr62786423ljj.14.1561122448747; 
	Fri, 21 Jun 2019 06:07:28 -0700 (PDT)
Received: from skyninja.webspeed.dk (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225])
	by smtp.gmail.com with ESMTPSA id r2sm387100lfi.51.2019.06.21.06.07.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:07:27 -0700 (PDT)
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
To: axboe@fb.com, hch@lst.de, damien.lemoal@wdc.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	ajay.joshi@wdc.com, aravind.ramesh@wdc.com, martin.petersen@oracle.com, 
	James.Bottomley@HansenPartnership.com, agk@redhat.com, snitzer@redhat.com
Date: Fri, 21 Jun 2019 15:07:07 +0200
Message-Id: <20190621130711.21986-1-mb@lightnvm.io>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 21 Jun 2019 13:07:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 21 Jun 2019 13:07:35 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: 0.192  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
Subject: [dm-devel] [PATCH 0/4] open, close, finish zone support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 07:44:07 +0000 (UTC)

Hi,

This patch serie adds support for explicit control of zone transitions.

To test it, one can use an updated blkzone version that is available
here:

  https://github.com/MatiasBjorling/util-linux.git zonemgmt

blkzone can be compiled with:

  ./autogen.sh
  ./configure
  make blkzone

After that, the binary is available in the compile directory.

Regards,
Matias

Ajay Joshi (4):
  block: add zone open, close and finish support
  null_blk: add zone open, close, and finish support
  scsi: sd_zbc: add zone open, close, and finish support
  dm: add zone open, close and finish support

 block/blk-core.c               |  3 ++
 block/blk-zoned.c              | 51 +++++++++++++++++++++---------
 block/ioctl.c                  |  5 ++-
 drivers/block/null_blk.h       |  4 +--
 drivers/block/null_blk_main.c  | 13 ++++++--
 drivers/block/null_blk_zoned.c | 33 ++++++++++++++++++--
 drivers/md/dm-flakey.c         |  7 ++---
 drivers/md/dm-linear.c         |  2 +-
 drivers/md/dm.c                |  5 +--
 drivers/scsi/sd.c              | 15 ++++++++-
 drivers/scsi/sd.h              |  6 ++--
 drivers/scsi/sd_zbc.c          | 18 ++++++++---
 include/linux/blk_types.h      | 35 +++++++++++++++++++--
 include/linux/blkdev.h         | 57 +++++++++++++++++++++++++++++-----
 include/uapi/linux/blkzoned.h  | 17 ++++++++--
 15 files changed, 221 insertions(+), 50 deletions(-)

-- 
2.19.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
