Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9564B084D
	for <lists+dm-devel@lfdr.de>; Thu, 10 Feb 2022 09:32:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-Iw5eV9VkPuu3TLVckvF94g-1; Thu, 10 Feb 2022 03:32:05 -0500
X-MC-Unique: Iw5eV9VkPuu3TLVckvF94g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805DD814249;
	Thu, 10 Feb 2022 08:31:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F18946C186;
	Thu, 10 Feb 2022 08:31:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 043644BB7C;
	Thu, 10 Feb 2022 08:31:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21A8VjFs002762 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Feb 2022 03:31:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6421540885A3; Thu, 10 Feb 2022 08:31:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 603BD40885A0
	for <dm-devel@redhat.com>; Thu, 10 Feb 2022 08:31:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44C37106655B
	for <dm-devel@redhat.com>; Thu, 10 Feb 2022 08:31:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-124-J26qtXmYPB6mgHZ4pl6J4A-1; Thu, 10 Feb 2022 03:31:43 -0500
X-MC-Unique: J26qtXmYPB6mgHZ4pl6J4A-1
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="236844600"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="236844600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Feb 2022 00:31:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="629615271"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
	by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2022 00:31:34 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI4rW-0002yF-8m; Thu, 10 Feb 2022 08:31:34 +0000
Date: Thu, 10 Feb 2022 16:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nitesh Shetty <nj.shetty@samsung.com>, mpatocka@redhat.com
Message-ID: <202202101647.VtWTgalm-lkp@intel.com>
References: <20220207141348.4235-8-nj.shetty@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20220207141348.4235-8-nj.shetty@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
	dm-devel@redhat.com, osandov@fb.com, javier@javigon.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org, hch@lst.de,
	roland@purestorage.com, nj.shetty@samsung.com, zach.brown@ni.com,
	chaitanyak@nvidia.com, msnitzer@redhat.com, josef@toxicpanda.com,
	linux-block@vger.kernel.org, dsterba@suse.com, kbusch@kernel.org,
	tytso@mit.edu, Frederick.Knight@netapp.com, axboe@kernel.dk,
	kbuild-all@lists.01.org, joshi.k@samsung.com,
	martin.petersen@oracle.com, arnav.dawn@samsung.com,
	jack@suse.com, linux-fsdevel@vger.kernel.org,
	lsf-pc@lists.linux-foundation.org
Subject: Re: [dm-devel] [PATCH v2 07/10] nvmet: add copy command support for
 bdev and file ns
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.17-rc3 next-20220209]
[cannot apply to device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nitesh-Shetty/block-make-bio_map_kern-non-static/20220207-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: arm64-randconfig-s032-20220207 (https://download.01.org/0day-ci/archive/20220210/202202101647.VtWTgalm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/6bb6ea64499e1ac27975e79bb2eee89f07861893
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nitesh-Shetty/block-make-bio_map_kern-non-static/20220207-231407
        git checkout 6bb6ea64499e1ac27975e79bb2eee89f07861893
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/nvme/target/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/io-cmd-bdev.c:52:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mcl @@     got restricted __le64 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:52:25: sparse:     expected restricted __le32 [usertype] mcl
   drivers/nvme/target/io-cmd-bdev.c:52:25: sparse:     got restricted __le64 [usertype]
>> drivers/nvme/target/io-cmd-bdev.c:53:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] mssrl @@     got restricted __le32 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:53:27: sparse:     expected restricted __le16 [usertype] mssrl
   drivers/nvme/target/io-cmd-bdev.c:53:27: sparse:     got restricted __le32 [usertype]
>> drivers/nvme/target/io-cmd-bdev.c:55:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] msrc @@     got restricted __le16 @@
   drivers/nvme/target/io-cmd-bdev.c:55:26: sparse:     expected unsigned char [usertype] msrc
   drivers/nvme/target/io-cmd-bdev.c:55:26: sparse:     got restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:58:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] msrc @@     got restricted __le16 @@
   drivers/nvme/target/io-cmd-bdev.c:58:34: sparse:     expected unsigned char [usertype] msrc
   drivers/nvme/target/io-cmd-bdev.c:58:34: sparse:     got restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:59:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] mssrl @@     got restricted __le32 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:59:35: sparse:     expected restricted __le16 [usertype] mssrl
   drivers/nvme/target/io-cmd-bdev.c:59:35: sparse:     got restricted __le32 [usertype]
>> drivers/nvme/target/io-cmd-bdev.c:61:35: sparse: sparse: cast to restricted __le32
>> drivers/nvme/target/io-cmd-bdev.c:61:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:61:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mcl @@     got restricted __le64 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:61:33: sparse:     expected restricted __le32 [usertype] mcl
   drivers/nvme/target/io-cmd-bdev.c:61:33: sparse:     got restricted __le64 [usertype]
   drivers/nvme/target/io-cmd-bdev.c:65:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] msrc @@     got restricted __le16 @@
   drivers/nvme/target/io-cmd-bdev.c:65:34: sparse:     expected unsigned char [usertype] msrc
   drivers/nvme/target/io-cmd-bdev.c:65:34: sparse:     got restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:66:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] mssrl @@     got restricted __le32 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:66:35: sparse:     expected restricted __le16 [usertype] mssrl
   drivers/nvme/target/io-cmd-bdev.c:66:35: sparse:     got restricted __le32 [usertype]
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast to restricted __le32
   drivers/nvme/target/io-cmd-bdev.c:68:35: sparse: sparse: cast from restricted __le16
   drivers/nvme/target/io-cmd-bdev.c:68:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mcl @@     got restricted __le64 [usertype] @@
   drivers/nvme/target/io-cmd-bdev.c:68:33: sparse:     expected restricted __le32 [usertype] mcl
   drivers/nvme/target/io-cmd-bdev.c:68:33: sparse:     got restricted __le64 [usertype]
--
>> drivers/nvme/target/admin-cmd.c:533:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] msrc @@     got restricted __le16 @@
   drivers/nvme/target/admin-cmd.c:533:26: sparse:     expected unsigned char [usertype] msrc
   drivers/nvme/target/admin-cmd.c:533:26: sparse:     got restricted __le16
>> drivers/nvme/target/admin-cmd.c:534:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] mssrl @@     got restricted __le32 [usertype] @@
   drivers/nvme/target/admin-cmd.c:534:27: sparse:     expected restricted __le16 [usertype] mssrl
   drivers/nvme/target/admin-cmd.c:534:27: sparse:     got restricted __le32 [usertype]
>> drivers/nvme/target/admin-cmd.c:535:27: sparse: sparse: cast to restricted __le32
>> drivers/nvme/target/admin-cmd.c:535:27: sparse: sparse: cast from restricted __le16
>> drivers/nvme/target/admin-cmd.c:535:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mcl @@     got restricted __le64 [usertype] @@
   drivers/nvme/target/admin-cmd.c:535:25: sparse:     expected restricted __le32 [usertype] mcl
   drivers/nvme/target/admin-cmd.c:535:25: sparse:     got restricted __le64 [usertype]

vim +52 drivers/nvme/target/io-cmd-bdev.c

    11	
    12	void nvmet_bdev_set_limits(struct block_device *bdev, struct nvme_id_ns *id)
    13	{
    14		const struct queue_limits *ql = &bdev_get_queue(bdev)->limits;
    15		/* Number of logical blocks per physical block. */
    16		const u32 lpp = ql->physical_block_size / ql->logical_block_size;
    17		/* Logical blocks per physical block, 0's based. */
    18		const __le16 lpp0b = to0based(lpp);
    19	
    20		/*
    21		 * For NVMe 1.2 and later, bit 1 indicates that the fields NAWUN,
    22		 * NAWUPF, and NACWU are defined for this namespace and should be
    23		 * used by the host for this namespace instead of the AWUN, AWUPF,
    24		 * and ACWU fields in the Identify Controller data structure. If
    25		 * any of these fields are zero that means that the corresponding
    26		 * field from the identify controller data structure should be used.
    27		 */
    28		id->nsfeat |= 1 << 1;
    29		id->nawun = lpp0b;
    30		id->nawupf = lpp0b;
    31		id->nacwu = lpp0b;
    32	
    33		/*
    34		 * Bit 4 indicates that the fields NPWG, NPWA, NPDG, NPDA, and
    35		 * NOWS are defined for this namespace and should be used by
    36		 * the host for I/O optimization.
    37		 */
    38		id->nsfeat |= 1 << 4;
    39		/* NPWG = Namespace Preferred Write Granularity. 0's based */
    40		id->npwg = lpp0b;
    41		/* NPWA = Namespace Preferred Write Alignment. 0's based */
    42		id->npwa = id->npwg;
    43		/* NPDG = Namespace Preferred Deallocate Granularity. 0's based */
    44		id->npdg = to0based(ql->discard_granularity / ql->logical_block_size);
    45		/* NPDG = Namespace Preferred Deallocate Alignment */
    46		id->npda = id->npdg;
    47		/* NOWS = Namespace Optimal Write Size */
    48		id->nows = to0based(ql->io_opt / ql->logical_block_size);
    49	
    50		/*Copy limits*/
    51		if (ql->max_copy_sectors) {
  > 52			id->mcl = cpu_to_le64((ql->max_copy_sectors << 9) / ql->logical_block_size);
  > 53			id->mssrl = cpu_to_le32((ql->max_copy_range_sectors << 9) /
    54					ql->logical_block_size);
  > 55			id->msrc = to0based(ql->max_copy_nr_ranges);
    56		} else {
    57			if (ql->zoned == BLK_ZONED_NONE) {
    58				id->msrc = to0based(BIO_MAX_VECS);
    59				id->mssrl = cpu_to_le32(
    60						(BIO_MAX_VECS << PAGE_SHIFT) / ql->logical_block_size);
  > 61				id->mcl = cpu_to_le64(le32_to_cpu(id->mssrl) * BIO_MAX_VECS);
    62	#ifdef CONFIG_BLK_DEV_ZONED
    63			} else {
    64				/* TODO: get right values for zoned device */
    65				id->msrc = to0based(BIO_MAX_VECS);
    66				id->mssrl = cpu_to_le32(min((BIO_MAX_VECS << PAGE_SHIFT),
    67						ql->chunk_sectors) / ql->logical_block_size);
    68				id->mcl = cpu_to_le64(min(le32_to_cpu(id->mssrl) * BIO_MAX_VECS,
    69							ql->chunk_sectors));
    70	#endif
    71			}
    72		}
    73	}
    74	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

