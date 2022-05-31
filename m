Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BD539421
	for <lists+dm-devel@lfdr.de>; Tue, 31 May 2022 17:39:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-d3-hvJ-UNjCo-mPpyKgTfA-1; Tue, 31 May 2022 11:39:51 -0400
X-MC-Unique: d3-hvJ-UNjCo-mPpyKgTfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE9221815CF7;
	Tue, 31 May 2022 15:39:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9E7340CFD0D;
	Tue, 31 May 2022 15:39:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D84A6194706D;
	Tue, 31 May 2022 15:39:40 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF3DC194705C
 for <dm-devel@listman.corp.redhat.com>; Tue, 31 May 2022 15:39:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B8871731B; Tue, 31 May 2022 15:39:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9780210725
 for <dm-devel@redhat.com>; Tue, 31 May 2022 15:39:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D2E585A5BC
 for <dm-devel@redhat.com>; Tue, 31 May 2022 15:39:39 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-qPR9xI34PjqixMGBi-jZ1Q-1; Tue, 31 May 2022 11:39:37 -0400
X-MC-Unique: qPR9xI34PjqixMGBi-jZ1Q-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24VFdFJH004068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 May 2022 11:39:16 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 36EBF15C3E1F; Tue, 31 May 2022 11:39:15 -0400 (EDT)
Date: Tue, 31 May 2022 11:39:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Donald Buczek <buczek@molgen.mpg.de>
Message-ID: <YpY2o/GG8HWJHTdo@mit.edu>
References: <4e83fb26-4d4a-d482-640c-8104973b7ebf@molgen.mpg.de>
 <20220531103834.vhscyk3yzsocorco@quack3.lan>
 <3bfd0ad9-d378-9631-310f-0a1a80d8e482@molgen.mpg.de>
MIME-Version: 1.0
In-Reply-To: <3bfd0ad9-d378-9631-310f-0a1a80d8e482@molgen.mpg.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [dm-devel] ext4_writepages: jbd2_start: 5120 pages, ino 11;
 err -5
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
 it+linux@molgen.mpg.de, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hmmm..... I think this patch should fix your issues.

If the journal has been aborted (which happens as part of the
shutdown, we will never write out the commit block --- so it should be
fine to skip the writeback of any dirty inodes in data=ordered mode.

BTW, if you know that the file system is going to get nuked in this
way all the time, so you never care about file system after it is shut
down, you could mount the file system with the mount option
data=writeback.

       	      	      	    		- Ted


diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 8ff4c6545a49..2e18211121f6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -542,7 +542,10 @@ static int ext4_journalled_submit_inode_data_buffers(struct jbd2_inode *jinode)
 static int ext4_journal_submit_inode_data_buffers(struct jbd2_inode *jinode)
 {
 	int ret;
+	journal_t *journal = EXT4_SB(jinode->i_vfs_inode->i_sb)->s_journal;
 
+	if (!journal || is_journal_aborted(journal))
+		return 0;
 	if (ext4_should_journal_data(jinode->i_vfs_inode))
 		ret = ext4_journalled_submit_inode_data_buffers(jinode);
 	else
@@ -554,7 +557,10 @@ static int ext4_journal_submit_inode_data_buffers(struct jbd2_inode *jinode)
 static int ext4_journal_finish_inode_data_buffers(struct jbd2_inode *jinode)
 {
 	int ret = 0;
+	journal_t *journal = EXT4_SB(jinode->i_vfs_inode->i_sb)->s_journal;
 
+	if (!journal || is_journal_aborted(journal))
+		return 0;
 	if (!ext4_should_journal_data(jinode->i_vfs_inode))
 		ret = jbd2_journal_finish_inode_data_buffers(jinode);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

