Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C624615AE27
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581527290;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GpCidgZh6ewl83zD5LjZnY8ofFVxm3xj2xYIUups2Qk=;
	b=M8XUgTClpGcDIO7mMqyZtsWeVol10fLRvU7FFd8YmJbmgQQmuMWY68j7fBcLCUAlq189OR
	TUUwPJks8m6QBNpgb63DG5/6THlRPU3OoR/3VUKjcMEMPPBxPTHcKRoteAzMWjPrM/dCSp
	i/R17X0tUKYYVj5fziaUjLFOu41kkMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-1bhWF6oVOf-wD7uSoe2DAw-1; Wed, 12 Feb 2020 12:08:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AD341005514;
	Wed, 12 Feb 2020 17:07:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D8D60BF1;
	Wed, 12 Feb 2020 17:07:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1A2D1803C33;
	Wed, 12 Feb 2020 17:07:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH7nwi001103 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:07:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9FC5B5C102; Wed, 12 Feb 2020 17:07:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 281445C101;
	Wed, 12 Feb 2020 17:07:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id B29462257D4; Wed, 12 Feb 2020 12:07:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Wed, 12 Feb 2020 12:07:29 -0500
Message-Id: <20200212170733.8092-3-vgoyal@redhat.com>
In-Reply-To: <20200212170733.8092-1-vgoyal@redhat.com>
References: <20200212170733.8092-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, jack@suse.cz, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 2/6] dax, iomap, ext4, ext2,
	xfs: Save dax_offset in "struct iomap"
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
X-MC-Unique: 1bhWF6oVOf-wD7uSoe2DAw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new field "sector_t dax_offset" to "struct iomap". This will be
filled by filesystems and dax code will make use of this to convert
sector into page offset (dax_pgoff()), instead of bdev_dax_pgoff(). This
removes the dependency of having to pass in block device for dax operations.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/ext2/inode.c       | 1 +
 fs/ext4/inode.c       | 1 +
 fs/xfs/xfs_iomap.c    | 2 ++
 include/linux/iomap.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index c885cf7d724b..5c3379e78d49 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -823,6 +823,7 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = (u64)first_block << blkbits;
 	iomap->dax_dev = sbi->s_daxdev;
+	iomap->dax_offset = get_start_sect(iomap->bdev);
 
 	if (ret == 0) {
 		iomap->type = IOMAP_HOLE;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 1305b810c44a..0ea7fbb8076f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3330,6 +3330,7 @@ static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
 
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
+	iomap->dax_offset = get_start_sect(iomap->bdev);
 	iomap->offset = (u64) map->m_lblk << blkbits;
 	iomap->length = (u64) map->m_len << blkbits;
 
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index bb590a267a7f..ad8b18fc96fd 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -80,6 +80,7 @@ xfs_bmbt_to_iomap(
 	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
 	iomap->bdev = target->bt_bdev;
 	iomap->dax_dev = target->bt_daxdev;
+	iomap->dax_offset = get_start_sect(iomap->bdev);
 	iomap->flags = flags;
 
 	if (xfs_ipincount(ip) &&
@@ -103,6 +104,7 @@ xfs_hole_to_iomap(
 	iomap->length = XFS_FSB_TO_B(ip->i_mount, end_fsb - offset_fsb);
 	iomap->bdev = target->bt_bdev;
 	iomap->dax_dev = target->bt_daxdev;
+	iomap->dax_offset = get_start_sect(iomap->bdev);
 }
 
 static inline xfs_fileoff_t
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8b09463dae0d..cac5d667aa74 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -84,6 +84,7 @@ struct iomap {
 	u16			flags;	/* flags for mapping */
 	struct block_device	*bdev;	/* block device for I/O */
 	struct dax_device	*dax_dev; /* dax_dev for dax operations */
+	sector_t		dax_offset; /* offset in dax device */
 	void			*inline_data;
 	void			*private; /* filesystem private */
 	const struct iomap_page_ops *page_ops;
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

