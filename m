Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E763796
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 16:17:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E38D30860C3;
	Tue,  9 Jul 2019 14:17:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1C7CA8451;
	Tue,  9 Jul 2019 14:16:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFC0818184AC;
	Tue,  9 Jul 2019 14:16:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69EG0jJ017344 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:16:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 870E195A59; Tue,  9 Jul 2019 14:16:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A9395A5B
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 14:15:57 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 137AC7FDCC
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 14:15:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so3433024wme.1
	for <dm-devel@redhat.com>; Tue, 09 Jul 2019 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=s2Sdd8NScQvak5bkIt9zHof7gD2zZS1JCwotihLZzQY=;
	b=Sgl6CystdHxuPd8ftXot1wu5Q6t1s8bIpuqggkOMuBUYoFBGFBnnf/VdgXtMGjUiyJ
	9Byjgp4281yWre2P/ZbduLWTOQc6gmlvadxABpzmNqid8YYMNOb6skB5IBxEq7L1ArcW
	pwIk5q/P5glXAM0HxhJd+utQXEI900QJbGvKHWu6ZT+3FW9nAkSeUNilXAAjUvSrxd/3
	NxhREQGgmu5eItLWMEJNoblCBrjQb8zo8kL2rf62Nz1UcW8WTNCIGGQYOQzA2naeB3Se
	84neE11CtP0ysdpL5fw89NyM2M0pS3wZoWnE3Lanoa+HNWGmydC4Luvw6Az56ibztqS4
	fUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s2Sdd8NScQvak5bkIt9zHof7gD2zZS1JCwotihLZzQY=;
	b=NXC4B8KjyUiFaxphgqGywn1k2MlSdjOm4llWcXQwSNyG/2WkwLefR2wRa+T1Rzw/HA
	55B47au6sUpsCli0tu7f6hrJRmyN4qxp5qE5BzKbVTJxna6QsKF2zSR14WahwClKWJO4
	uOJO2hyDXhHT7C97IUv6QSWtz7k3rdZ5VRZWuFZQoeN7fwcjFSIBqTpnd6wZtt3SL35H
	YO+cPfXtryk3Aj/ZSxDXHAd8NiObp7MzkXBihioL9/pTLqfn1g66zEd3HIAwWDg/ZU+r
	u21gV7YXSzBIcailg1F7h3pRk3Dn6viiRgIkNGYIQgFRgpoeZFEBu606nCue5yY4nLcl
	7Owg==
X-Gm-Message-State: APjAAAWM9EKz7RGdwJWxhnSh0oXm+Ybsag/HMWAMbvkQOCohSt1kxSk3
	a7cqm5jMvbYafQ/GSezA7Cq+Ow==
X-Google-Smtp-Source: APXvYqxAuJQobFIBkxz520zws3/bFkGDMbFSTGr6d8kCwJ8CptVS0QPZ26BSCyyFFZhuu1OcA60nDQ==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr195382wme.81.1562681735811; 
	Tue, 09 Jul 2019 07:15:35 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	o6sm37769169wra.27.2019.07.09.07.15.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jul 2019 07:15:35 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Tue,  9 Jul 2019 17:15:21 +0300
Message-Id: <20190709141522.29606-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 Jul 2019 14:15:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 09 Jul 2019 14:15:37 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 1.294 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [RFC PATCH 0/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 09 Jul 2019 14:17:39 +0000 (UTC)

This patch adds the dm-clone target, which allows cloning of arbitrary
block devices.

dm-clone produces a one-to-one copy of an existing, read-only device
(origin) into a writable device (clone): It presents a virtual block
device which makes all data appear immediately, and redirects reads and
writes accordingly.

The main use case of dm-clone is to clone a potentially remote,
high-latency, read-only, archival-type block device into a writable,
fast, primary-type device for fast, low-latency I/O. The cloned device
is visible/mountable immediately and the copy of the origin device to
the clone device happens in the background, in parallel with user I/O.

For example, one could restore an application backup from a read-only
copy, accessible through a network storage protocol (NBD, Fibre Channel,
iSCSI, AoE, etc.), into a local SSD or NVMe device, and start using the
device immediately, without waiting for the restore to complete.

When the cloning completes, the dm-clone table can be removed altogether
and be replaced, e.g., by a linear table, mapping directly to the clone
device.

dm-clone is optimized for small, random writes, with size equal to
dm-clone's block/region size, e.g., 4K.

For more information regarding dm-clone's operation, please read the
attached documentation.

A preliminary test suite for dm-clone can be found at
https://github.com/arrikto/device-mapper-test-suite/tree/feature-dm-clone

Nikos Tsironis (1):
  dm: add clone target

 Documentation/device-mapper/dm-clone.rst |  334 +++++
 drivers/md/Kconfig                       |   13 +
 drivers/md/Makefile                      |    2 +
 drivers/md/dm-clone-metadata.c           |  991 +++++++++++++
 drivers/md/dm-clone-metadata.h           |  158 +++
 drivers/md/dm-clone-target.c             | 2244 ++++++++++++++++++++++++++++++
 6 files changed, 3742 insertions(+)
 create mode 100644 Documentation/device-mapper/dm-clone.rst
 create mode 100644 drivers/md/dm-clone-metadata.c
 create mode 100644 drivers/md/dm-clone-metadata.h
 create mode 100644 drivers/md/dm-clone-target.c

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
