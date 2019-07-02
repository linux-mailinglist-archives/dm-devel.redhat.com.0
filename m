Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B555D0A4
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 15:27:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFA2230C585B;
	Tue,  2 Jul 2019 13:26:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7551537D6;
	Tue,  2 Jul 2019 13:26:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F44C18363C2;
	Tue,  2 Jul 2019 13:26:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62DOJ8X023759 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 09:24:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1569E6F957; Tue,  2 Jul 2019 13:24:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B128702D0;
	Tue,  2 Jul 2019 13:24:13 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D32030C34CA;
	Tue,  2 Jul 2019 13:23:52 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 8185FB2B9D1B45AE75A8;
	Tue,  2 Jul 2019 21:23:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
	21:23:41 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-raid@vger.kernel.org>, <songliubraving@fb.com>
Date: Tue, 2 Jul 2019 21:29:16 +0800
Message-ID: <20190702132918.114818-2-houtao1@huawei.com>
In-Reply-To: <20190702132918.114818-1-houtao1@huawei.com>
References: <20190702132918.114818-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Tue, 02 Jul 2019 13:24:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 02 Jul 2019 13:24:02 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'houtao1@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <houtao1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, neilb@suse.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	houtao1@huawei.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 1/3] md-debugfs: add md_debugfs_create_files()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 02 Jul 2019 13:27:18 +0000 (UTC)

It will be used by the following patches to create debugfs files
under /sys/kernel/debug/mdX.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/Makefile     |  2 +-
 drivers/md/md-debugfs.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/md/md-debugfs.h | 16 ++++++++++++++++
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 drivers/md/md-debugfs.c
 create mode 100644 drivers/md/md-debugfs.h

diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index be7a6eb92abc..49355e3b4cce 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -19,7 +19,7 @@ dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
 dm-cache-smq-y   += dm-cache-policy-smq.o
 dm-era-y	+= dm-era-target.o
 dm-verity-y	+= dm-verity-target.o
-md-mod-y	+= md.o md-bitmap.o
+md-mod-y	+= md.o md-bitmap.o md-debugfs.o
 raid456-y	+= raid5.o raid5-cache.o raid5-ppl.o
 dm-zoned-y	+= dm-zoned-target.o dm-zoned-metadata.o dm-zoned-reclaim.o
 linear-y	+= md-linear.o
diff --git a/drivers/md/md-debugfs.c b/drivers/md/md-debugfs.c
new file mode 100644
index 000000000000..318c35fed24f
--- /dev/null
+++ b/drivers/md/md-debugfs.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Based on debugfs_create_files() in blk-mq */
+
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+
+#include "md-debugfs.h"
+
+static int md_debugfs_open(struct inode *inode, struct file *file)
+{
+	const struct md_debugfs_file *dbg_file = inode->i_private;
+	void *data = d_inode(file_dentry(file)->d_parent)->i_private;
+
+	return single_open(file, dbg_file->show, data);
+}
+
+static const struct file_operations md_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = md_debugfs_open,
+	.llseek = seq_lseek,
+	.read = seq_read,
+	.release = single_release,
+};
+
+void md_debugfs_create_files(struct dentry *parent, void *data,
+		const struct md_debugfs_file *files)
+{
+	const struct md_debugfs_file *file;
+
+	d_inode(parent)->i_private = data;
+
+	for (file = files; file->name; file++)
+		debugfs_create_file(file->name, 0444, parent,
+				(void *)file, &md_debugfs_fops);
+}
diff --git a/drivers/md/md-debugfs.h b/drivers/md/md-debugfs.h
new file mode 100644
index 000000000000..13b581d4ab63
--- /dev/null
+++ b/drivers/md/md-debugfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MD_DEBUGFS_H
+#define _MD_DEBUGFS_H
+
+#include <linux/seq_file.h>
+#include <linux/debugfs.h>
+
+struct md_debugfs_file {
+	const char *name;
+	int (*show)(struct seq_file *m, void *data);
+};
+
+extern void md_debugfs_create_files(struct dentry *parent, void *data,
+		const struct md_debugfs_file *files);
+#endif
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
