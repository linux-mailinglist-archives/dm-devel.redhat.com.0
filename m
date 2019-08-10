Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304988E90
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 23:44:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E99258667D;
	Sat, 10 Aug 2019 21:44:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A27E194B9;
	Sat, 10 Aug 2019 21:44:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE4E61800202;
	Sat, 10 Aug 2019 21:44:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ALhlbr025542 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 17:43:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68F3E60600; Sat, 10 Aug 2019 21:43:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBD360872;
	Sat, 10 Aug 2019 21:43:43 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 047E08830C;
	Sat, 10 Aug 2019 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565473414; x=1597009414;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=oqC9vwnwD0v5yDdP5Ry5VqCn1bXZJBKh7qYxFUl79wI=;
	b=mgUaThvo0Gl4K5FRVjoJtZx7QIvub90UitjA3ql65EMn/Tb/UrZWb0ey
	DdDq7bXY6TUx1ViYSjvTbPoCliQ3+ua919lE6G3yFpRuthtobTC8mDzJW
	ZoXeOEV4GceSu3bvbFBaoUR6aFJeEctPUqlxPlTxB3ut+/xSdtvboK8VK
	A/fqkyZJR+jwNdK47/iRp8YiNVuU6gf0tf32RE+qKwzawQopNVTYHvaJa
	sX+piZ+WLaevCEQ2guBrl5SrBj7+7gluEwI2AMMrWgy4LpIqyxaXi45UX
	UnV0DOLlQJh/BzwbXdczAVleY14YMI/v/QL9ZnpU1VvMeFVqQ10z+/fcc A==;
IronPort-SDR: fN9tHQBAQHu5GEXZcV7uiz/s2ydSTasW+OmXENKN8tv1EDTm1FtqdudRmPU1d4We3Lx6/3XR90
	0DLpgW88qT9sep3e7a93PB8UEjYLhbsJrc4EeXqHykqUhncLP5W8dqsR9U1y3IuNPTZo7tREQp
	UpOv9dxSrDnl2evu+w/WRWJKjkcA25FkSLcYQhTUSSgvga7LIy5kKVttz+kLv/dEmI00TVPeea
	NB2A8ONAuEhLlJjpVtjohZmvImSSsttEkl8TfN2MRtJ/2MU3pCyTQXPmVGkI1iqAuPFeXhKZul
	Dqw=
X-IronPort-AV: E=Sophos;i="5.64,370,1559491200"; d="scan'208";a="115569223"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2019 05:43:12 +0800
IronPort-SDR: I6GyzhGGAY9uYnufoBfwAFEYxjXejBojg0CL95Xk1hvR6xF3LzATz6UYiMKGhP77fzldq0mMcW
	gmD4zxTM51q64kRDhUx4jQ23WL5FQRll+ob+Xb6O2zy2I92i2aFQefIwaZUKCcRAIfjA3Pyf40
	nEhYkgi9Yod3fSr2q41+FeEJ1Mp41JHAE7/oOyipEB3OXC0ymnG/x+YPRM2QrYp/t+DTp88bA6
	ToY20tNBcn/vbNCWSVPHbck/f7ryPJHxvviRXn2jyMR1mcV62h1C5eGzevw5R07WHP8JNk+iPl
	IliqLSSPFEqDttlxKzk8SYiB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Aug 2019 14:40:51 -0700
IronPort-SDR: hXqdGPqvXdSFEjmdAP7I9XSn5e4YDq09ECpRH786ietU11q/Pulw+myHKvwbz3dks3OA8nsnY3
	4/jz8svQAYwA+dpqtRHFA3/yxXta18YcWd0I0t4AtVXiNb0BFv/gqF/BeddjHoWOEegtbFGVRN
	rMqBLBrfTs/47ttHgUs2U2Q9wO/9+vf00aqZ3fLUORQtOrhRGot23KyapXGFy/K0Rd12tDQp/t
	bBnYfoW0FEH/2fmVeYuhzQU1Az0IQj8WTCfqETd45CYt9rklgPTie5c8uwsEefEF0qAGgLtbdj
	ZRM=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Aug 2019 14:43:12 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sat, 10 Aug 2019 14:43:08 -0700
Message-Id: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Sat, 10 Aug 2019 21:43:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 10 Aug 2019 21:43:34 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=1182bd66c=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH v2 0/3] dm-zoned: harden error handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 10 Aug 2019 21:44:18 +0000 (UTC)

This series contains a few patches aimed to make dm-zoned properly
handle backing zoned storage device failures.

The following test environment was used to trigger device failures:
A 100% write file I/O fio workload was run against an XFS volume
created on top of a dm-zoned target device. The dm-zoned device,
in turn, was created on top of a zoned device provisioned by
tcmu-runner ZBC file handler. The backing storage file for the
tcmu-runner handler has been created on a separate ext4 file system.

Two different failure modes were tested -
1. Removal of the tcmu-runner device under I/O
2. Complete failure of the backing storage of tcmu-runner under I/O

In both of these test cases, dm-zoned has been observed to hang and
the only possible remedy to recover from that state was to reboot the
test system. The fio test script would also hang forever.

With these patches in place, the test script properly reports the
error and exits. After that, it is possible to remove the dm-zoned
target device and then recreate it with some working backup storage
without rebooting the system.

v1 -> v2:	- don't set dm-zoned disk read-only after BD failure

Dmitry Fomichev (3):
  dm-zoned: improve error handling in reclaim
  dm-zoned: improve error handling in i/o map code
  dm-zoned: properly handle backing device failure

 drivers/md/dm-zoned-metadata.c | 55 ++++++++++++++++++++++------
 drivers/md/dm-zoned-reclaim.c  | 44 +++++++++++++++++-----
 drivers/md/dm-zoned-target.c   | 67 ++++++++++++++++++++++++++++++----
 drivers/md/dm-zoned.h          | 10 +++++
 4 files changed, 146 insertions(+), 30 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
