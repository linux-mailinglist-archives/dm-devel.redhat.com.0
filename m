Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1C1BEDF4
	for <lists+dm-devel@lfdr.de>; Thu, 30 Apr 2020 03:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588211865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D4swqB3JYSyQxN+ZCfSK4COKgDTz6XnHuwmAb7w9T10=;
	b=GXq/RZM/SjZacq/C9oBDaQ4uMFzCd7e8OLNmqwTHlVl21ULE4A62DH5lgDP+hRa7Q+k0Oy
	VyeP0VNWGQK7vDojqmIyibYXe8BWlZzDiItWRBJFYltv6lHhLViWtUu3Ota7lkkqwDpuiJ
	K5rAk6JK7H5ZS20Lxwera3K/siWWsPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-WgQ8xBEaOrejym_BJrEmDw-1; Wed, 29 Apr 2020 21:57:42 -0400
X-MC-Unique: WgQ8xBEaOrejym_BJrEmDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDBDE1858E2B;
	Thu, 30 Apr 2020 01:57:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8896C60BF4;
	Thu, 30 Apr 2020 01:57:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02B851809542;
	Thu, 30 Apr 2020 01:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03U1v636031268 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 21:57:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37E051108ED; Thu, 30 Apr 2020 01:57:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E79114CBE
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 01:57:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C60101A526
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 01:57:03 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-Td5yPYzTN1W5QP0iTgU9kQ-1; Wed, 29 Apr 2020 21:56:58 -0400
X-MC-Unique: Td5yPYzTN1W5QP0iTgU9kQ-1
IronPort-SDR: DviBtiC7bDZzRhUocUKaTz4mcnaAzzKeEsU0o/n4nLkQhSftGQBuUCB31+tvi24tRxtvGzKha7
	Lv8Nrgb18n5Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Apr 2020 18:56:57 -0700
IronPort-SDR: 4inCosiR5s5utmgYdJgpm92lmEiuEXP/Lv/wBoE65/9CsyflEiQvRULl1RDgyCcRrC9uhdGGQE
	QOnW0nyiun5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; d="scan'208";a="282694434"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
	([10.239.159.140])
	by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2020 18:56:55 -0700
Date: Thu, 30 Apr 2020 10:07:10 +0800
From: kbuild test robot <lkp@intel.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <20200430020710.GG15540@xsang-OptiPlex-9020>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03U1v636031268
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kbuild-all@lists.01.org,
	Damien Le Moal <DamienLeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [dm:for-next 29/30] drivers/md/dm-ebs-target.c:190:32:
 sparse: expected restricted blk_status_t [usertype] bi_status
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   ddc1316e185f6ab4a74656b4879a15ec23cdec31
commit: eeb17d25430dc2b3251a5abfec6a3b9160daaef6 [29/30] dm ebs: new block size emulating target
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout eeb17d25430dc2b3251a5abfec6a3b9160daaef6
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 7 hours ago
:::::: commit date: 30 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/md/dm-ebs-target.c:190:32: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted blk_status_t [usertype] bi_status @@    got s_t [usertype] bi_status @@
>> drivers/md/dm-ebs-target.c:190:32: sparse:    expected restricted blk_status_t [usertype] bi_status
>> drivers/md/dm-ebs-target.c:190:32: sparse:    got int [assigned] r
   drivers/md/dm-ebs-target.c:423:12: sparse: sparse: symbol 'dm_ebs_init' was not declared. Should it be static?
   drivers/md/dm-ebs-target.c:433:6: sparse: sparse: symbol 'dm_ebs_exit' was not declared. Should it be static?

# https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?id=eeb17d25430dc2b3251a5abfec6a3b9160daaef6
git remote add dm https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
git remote update dm
git checkout eeb17d25430dc2b3251a5abfec6a3b9160daaef6
vim +190 drivers/md/dm-ebs-target.c

eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  146  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  147  /* Worker funtion to process incoming bios. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  148  static void __ebs_process_bios(struct work_struct *ws)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  149  {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  150  	int r;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  151  	bool write = false;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  152  	sector_t block1, block2;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  153  	struct ebs_c *ec = container_of(ws, struct ebs_c, ws);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  154  	struct bio *bio;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  155  	struct bio_list bios;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  156  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  157  	bio_list_init(&bios);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  158  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  159  	spin_lock_irq(&ec->lock);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  160  	bios = ec->bios_in;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  161  	bio_list_init(&ec->bios_in);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  162  	spin_unlock_irq(&ec->lock);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  163  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  164  	/* Prefetch all read and any mis-aligned write buffers */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  165  	bio_list_for_each(bio, &bios) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  166  		block1 = __sector_to_block(ec, bio->bi_iter.bi_sector);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  167  		if (bio_op(bio) == REQ_OP_READ)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  168  			dm_bufio_prefetch(ec->bufio, block1, __nr_blocks(ec, bio));
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  169  		else if (bio_op(bio) == REQ_OP_WRITE && !(bio->bi_opf & REQ_PREFLUSH)) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  170  			block2 = __sector_to_block(ec, bio_end_sector(bio));
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  171  			if (__block_mod(bio->bi_iter.bi_sector, ec->u_bs))
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  172  				dm_bufio_prefetch(ec->bufio, block1, 1);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  173  			if (__block_mod(bio_end_sector(bio), ec->u_bs) && block2 != block1)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  174  				dm_bufio_prefetch(ec->bufio, block2, 1);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  175  		}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  176  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  177  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  178  	bio_list_for_each(bio, &bios) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  179  		r = -EIO;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  180  		if (bio_op(bio) == REQ_OP_READ)
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  181  			r = __ebs_rw_bio(ec, READ, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  182  		else if (bio_op(bio) == REQ_OP_WRITE) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  183  			write = true;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  184  			r = __ebs_rw_bio(ec, WRITE, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  185  		} else if (bio_op(bio) == REQ_OP_DISCARD) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  186  			/* FIXME: (optionally) call dm_bufio_discard_buffers() once upstream. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  187  			r = __ebs_forget_bio(ec, bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  188  		}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  189  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09 @190  		bio->bi_status = r;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  191  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  192  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  193  	/*
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  194  	 * We write dirty buffers after processing I/O on them
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  195  	 * but before we endio thus addressing REQ_FUA/REQ_SYNC.
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  196  	 */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  197  	r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  198  
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  199  	while ((bio = bio_list_pop(&bios))) {
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  200  		/* Any other request is endioed. */
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  201  		if (unlikely(r && bio_op(bio) == REQ_OP_WRITE))
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  202  			bio_io_error(bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  203  		else
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  204  			bio_endio(bio);
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  205  	}
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  206  }
eeb17d25430dc2 Heinz Mauelshagen 2020-03-09  207  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

