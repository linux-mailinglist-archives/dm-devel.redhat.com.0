Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 241186ED1D1
	for <lists+dm-devel@lfdr.de>; Mon, 24 Apr 2023 17:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682351738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wB9BRd2Ldg50QMEZhaEU966CAgwD832tYjOdhkgUDiQ=;
	b=UhibPeFkBqYC/UKm5BVnWq0+5kupmHfsJtFAdWo6f0YDg2ARlhmCoKgCz2Iq7CvT7AJ5Km
	4uon374lw7n64Jfd2Yj/B2eTMog0yEZV0d6YGv3sR+/rgyZCzKcQ0TD73YvyCSGmwzNz4A
	HxhJV600v6GwGrp1v7Fh0JxV7H+GiZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-K0wVl_-WNmGzbwTs7KpGtA-1; Mon, 24 Apr 2023 11:55:35 -0400
X-MC-Unique: K0wVl_-WNmGzbwTs7KpGtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DC88858289;
	Mon, 24 Apr 2023 15:55:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1486C40C6E67;
	Mon, 24 Apr 2023 15:55:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7AFD719465A3;
	Mon, 24 Apr 2023 15:55:13 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F13D61946588
 for <dm-devel@listman.corp.redhat.com>; Mon, 24 Apr 2023 15:55:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D735B40C6E6A; Mon, 24 Apr 2023 15:55:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF70C40C6E68
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 15:55:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE7BA857F81
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 15:55:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-FbOV4zSlPoqj9frQmU0JHA-1; Mon, 24 Apr 2023 11:55:00 -0400
X-MC-Unique: FbOV4zSlPoqj9frQmU0JHA-1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345244379"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="345244379"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 08:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="804667850"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="804667850"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2023 08:54:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pqyWi-000iUi-2i;
 Mon, 24 Apr 2023 15:54:52 +0000
Date: Mon, 24 Apr 2023 23:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Message-ID: <202304242302.5zYRfUub-lkp@intel.com>
References: <20230420004850.297045-2-sarthakkukreti@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230420004850.297045-2-sarthakkukreti@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v5 1/5] block: Don't invalidate pagecache for
 invalid falloc modes
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
Cc: Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@google.com>,
 Theodore Ts'o <tytso@mit.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Jason Wang <jasowang@redhat.com>,
 llvm@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Daniil Lunev <dlunev@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, oe-kbuild-all@lists.linux.dev,
 Brian Foster <bfoster@redhat.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sarthak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.3 next-20230421]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarthak-Kukreti/block-Introduce-provisioning-primitives/20230420-095025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20230420004850.297045-2-sarthakkukreti%40chromium.org
patch subject: [PATCH v5 1/5] block: Don't invalidate pagecache for invalid falloc modes
config: hexagon-randconfig-r006-20230424 (https://download.01.org/0day-ci/archive/20230424/202304242302.5zYRfUub-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8bd0744b438be1722c5f8c1fe077e9dcef0e81b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sarthak-Kukreti/block-Introduce-provisioning-primitives/20230420-095025
        git checkout 8bd0744b438be1722c5f8c1fe077e9dcef0e81b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304242302.5zYRfUub-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/fops.c:9:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from block/fops.c:9:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from block/fops.c:9:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> block/fops.c:678:2: warning: unused label 'fail' [-Wunused-label]
    fail:
    ^~~~~
   7 warnings generated.


vim +/fail +678 block/fops.c

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  613  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  614  #define	BLKDEV_FALLOC_FL_SUPPORTED					\
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  615  		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  616  		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_NO_HIDE_STALE)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  617  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  618  static long blkdev_fallocate(struct file *file, int mode, loff_t start,
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  619  			     loff_t len)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  620  {
f278eb3d8178f9 Ming Lei          2021-09-23  621  	struct inode *inode = bdev_file_inode(file);
f278eb3d8178f9 Ming Lei          2021-09-23  622  	struct block_device *bdev = I_BDEV(inode);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  623  	loff_t end = start + len - 1;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  624  	loff_t isize;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  625  	int error;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  626  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  627  	/* Fail if we don't recognize the flags. */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  628  	if (mode & ~BLKDEV_FALLOC_FL_SUPPORTED)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  629  		return -EOPNOTSUPP;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  630  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  631  	/* Don't go off the end of the device. */
2a93ad8fcb377b Christoph Hellwig 2021-10-18  632  	isize = bdev_nr_bytes(bdev);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  633  	if (start >= isize)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  634  		return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  635  	if (end >= isize) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  636  		if (mode & FALLOC_FL_KEEP_SIZE) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  637  			len = isize - start;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  638  			end = start + len - 1;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  639  		} else
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  640  			return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  641  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  642  
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  643  	/*
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  644  	 * Don't allow IO that isn't aligned to logical block size.
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  645  	 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  646  	if ((start | len) & (bdev_logical_block_size(bdev) - 1))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  647  		return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  648  
f278eb3d8178f9 Ming Lei          2021-09-23  649  	filemap_invalidate_lock(inode->i_mapping);
f278eb3d8178f9 Ming Lei          2021-09-23  650  
8bd0744b438be1 Sarthak Kukreti   2023-04-19  651  	/*
8bd0744b438be1 Sarthak Kukreti   2023-04-19  652  	 * Invalidate the page cache, including dirty pages, for valid
8bd0744b438be1 Sarthak Kukreti   2023-04-19  653  	 * de-allocate mode calls to fallocate().
8bd0744b438be1 Sarthak Kukreti   2023-04-19  654  	 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  655  	switch (mode) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  656  	case FALLOC_FL_ZERO_RANGE:
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  657  	case FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  658  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  659  			blkdev_issue_zeroout(bdev, start >> SECTOR_SHIFT,
6549a874fb65e7 Pavel Begunkov    2021-10-20  660  					     len >> SECTOR_SHIFT, GFP_KERNEL,
6549a874fb65e7 Pavel Begunkov    2021-10-20  661  					     BLKDEV_ZERO_NOUNMAP);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  662  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  663  	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  664  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  665  			blkdev_issue_zeroout(bdev, start >> SECTOR_SHIFT,
6549a874fb65e7 Pavel Begunkov    2021-10-20  666  					     len >> SECTOR_SHIFT, GFP_KERNEL,
6549a874fb65e7 Pavel Begunkov    2021-10-20  667  					     BLKDEV_ZERO_NOFALLBACK);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  668  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  669  	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE | FALLOC_FL_NO_HIDE_STALE:
8bd0744b438be1 Sarthak Kukreti   2023-04-19  670  		error = truncate_bdev_range(bdev, file->f_mode, start, end) ||
8bd0744b438be1 Sarthak Kukreti   2023-04-19  671  			blkdev_issue_discard(bdev, start >> SECTOR_SHIFT,
44abff2c0b970a Christoph Hellwig 2022-04-15  672  					     len >> SECTOR_SHIFT, GFP_KERNEL);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  673  		break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  674  	default:
f278eb3d8178f9 Ming Lei          2021-09-23  675  		error = -EOPNOTSUPP;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  676  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  677  
f278eb3d8178f9 Ming Lei          2021-09-23 @678   fail:
f278eb3d8178f9 Ming Lei          2021-09-23  679  	filemap_invalidate_unlock(inode->i_mapping);
f278eb3d8178f9 Ming Lei          2021-09-23  680  	return error;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  681  }
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  682  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

