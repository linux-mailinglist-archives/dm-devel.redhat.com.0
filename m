Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88A6D5804
	for <lists+dm-devel@lfdr.de>; Tue,  4 Apr 2023 07:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680586244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o/aP9i6M7WiS43+la7+S4Q94BzABiyCVDhkGuQnWL2A=;
	b=PZ178uA3nEVzB7OcGmLzeUTSFFLX9GcF+vM6Mh3ijPGIcyVQqK9W7abRzVcmGsaS+WTFTH
	bfW+6MpFjra6k4zOy0L+UuATLBvrRYAfGz1bhsu0SIUc5w2qxe8J7c0Utm+bo7VGKeugfh
	MzKbveUBaP/+6v7g7TH21Ynk81QmteQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-RIobzm5dNj6f3TP5v9OPcA-1; Tue, 04 Apr 2023 01:30:42 -0400
X-MC-Unique: RIobzm5dNj6f3TP5v9OPcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29024811E7C;
	Tue,  4 Apr 2023 05:30:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C03F40C83B6;
	Tue,  4 Apr 2023 05:30:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7B9C1946A48;
	Tue,  4 Apr 2023 05:30:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD15D194658C
 for <dm-devel@listman.corp.redhat.com>; Tue,  4 Apr 2023 05:30:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0321C1602B; Tue,  4 Apr 2023 05:30:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8B3EC1602A
 for <dm-devel@redhat.com>; Tue,  4 Apr 2023 05:30:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7961811E7C
 for <dm-devel@redhat.com>; Tue,  4 Apr 2023 05:30:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-nuIAjOGCNCODN0MhnFblzg-1; Tue, 04 Apr 2023 01:30:28 -0400
X-MC-Unique: nuIAjOGCNCODN0MhnFblzg-1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428377413"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="428377413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 22:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686242063"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="686242063"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 22:30:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjZF8-000PEe-10;
 Tue, 04 Apr 2023 05:30:06 +0000
Date: Tue, 4 Apr 2023 13:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Christie <michael.christie@oracle.com>, bvanassche@acm.org,
 hch@lst.de, martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 james.bottomley@hansenpartnership.com, linux-block@vger.kernel.org,
 dm-devel@redhat.com, snitzer@kernel.org, axboe@kernel.dk,
 linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Message-ID: <202304041322.SEFV29Co-lkp@intel.com>
References: <20230324181741.13908-19-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230324181741.13908-19-michael.christie@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v5 18/18] scsi: target: Add block PR support
 to iblock
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
Cc: Mike Christie <michael.christie@oracle.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next axboe-block/for-next linus/master v6.3-rc5 next-20230403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Christie/block-Add-PR-callouts-for-read-keys-and-reservation/20230325-022314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230324181741.13908-19-michael.christie%40oracle.com
patch subject: [PATCH v5 18/18] scsi: target: Add block PR support to iblock
config: ia64-randconfig-s043-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041322.SEFV29Co-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f3fe3a0cab8498044d99362b81e01f5c48da5f63
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Christie/block-Add-PR-callouts-for-read-keys-and-reservation/20230325-022314
        git checkout f3fe3a0cab8498044d99362b81e01f5c48da5f63
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041322.SEFV29Co-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/target/target_core_iblock.c:968:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:968:24: sparse:     expected int
   drivers/target/target_core_iblock.c:968:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:973:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:973:24: sparse:     expected int
   drivers/target/target_core_iblock.c:973:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:985:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:985:24: sparse:     expected int
   drivers/target/target_core_iblock.c:985:24: sparse:     got restricted sense_reason_t
>> drivers/target/target_core_iblock.c:996:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:996:21: sparse:     expected int [assigned] ret
   drivers/target/target_core_iblock.c:996:21: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1000:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1000:13: sparse:     expected int [assigned] ret
   drivers/target/target_core_iblock.c:1000:13: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1035:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1035:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1035:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1040:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1040:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1040:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1044:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1044:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1044:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1049:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1049:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1049:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1055:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1055:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1055:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1059:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1059:24: sparse:     expected int
   drivers/target/target_core_iblock.c:1059:24: sparse:     got restricted sense_reason_t
   drivers/target/target_core_iblock.c:1062:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted sense_reason_t @@
   drivers/target/target_core_iblock.c:1062:16: sparse:     expected int
   drivers/target/target_core_iblock.c:1062:16: sparse:     got restricted sense_reason_t
>> drivers/target/target_core_iblock.c:1075:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted sense_reason_t [usertype] ret @@     got int @@
   drivers/target/target_core_iblock.c:1075:21: sparse:     expected restricted sense_reason_t [usertype] ret
   drivers/target/target_core_iblock.c:1075:21: sparse:     got int
   drivers/target/target_core_iblock.c:1078:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted sense_reason_t [usertype] ret @@     got int @@
   drivers/target/target_core_iblock.c:1078:21: sparse:     expected restricted sense_reason_t [usertype] ret
   drivers/target/target_core_iblock.c:1078:21: sparse:     got int

vim +968 drivers/target/target_core_iblock.c

   956	
   957	static int iblock_pr_read_keys(struct se_cmd *cmd, unsigned char *param_data)
   958	{
   959		struct se_device *dev = cmd->se_dev;
   960		struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
   961		struct block_device *bdev = ib_dev->ibd_bd;
   962		const struct pr_ops *ops = bdev->bd_disk->fops->pr_ops;
   963		int i, ret, len, paths, data_offset;
   964		struct pr_keys *keys;
   965	
   966		if (!ops) {
   967			pr_err("Block device does not support pr_ops but iblock device has been configured for PR passthrough.\n");
 > 968			return TCM_UNSUPPORTED_SCSI_OPCODE;
   969		}
   970	
   971		if (!ops->pr_read_keys) {
   972			pr_err("Block device does not support read_keys.\n");
   973			return TCM_UNSUPPORTED_SCSI_OPCODE;
   974		}
   975	
   976		/*
   977		 * We don't know what's under us, but dm-multipath will register every
   978		 * path with the same key, so start off with enough space for 16 paths.
   979		 */
   980		paths = 16;
   981	retry:
   982		len = 8 * paths;
   983		keys = kzalloc(sizeof(*keys) + len, GFP_KERNEL);
   984		if (!keys)
   985			return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
   986	
   987		keys->num_keys = paths;
   988		ret = ops->pr_read_keys(bdev, keys);
   989		if (!ret) {
   990			if (keys->num_keys > paths) {
   991				kfree(keys);
   992				paths *= 2;
   993				goto retry;
   994			}
   995		} else if (ret) {
 > 996			ret = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
   997			goto free_keys;
   998		}
   999	
  1000		ret = TCM_NO_SENSE;
  1001	
  1002		put_unaligned_be32(keys->generation, &param_data[0]);
  1003		if (!keys->num_keys) {
  1004			put_unaligned_be32(0, &param_data[4]);
  1005			goto free_keys;
  1006		}
  1007	
  1008		put_unaligned_be32(8 * keys->num_keys, &param_data[4]);
  1009	
  1010		data_offset = 8;
  1011		for (i = 0; i < keys->num_keys; i++) {
  1012			if (data_offset + 8 > cmd->data_length)
  1013				break;
  1014	
  1015			put_unaligned_be64(keys->keys[i], &param_data[data_offset]);
  1016			data_offset += 8;
  1017		}
  1018	
  1019	free_keys:
  1020		kfree(keys);
  1021		return ret;
  1022	}
  1023	
  1024	static int iblock_pr_read_reservation(struct se_cmd *cmd,
  1025					      unsigned char *param_data)
  1026	{
  1027		struct se_device *dev = cmd->se_dev;
  1028		struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
  1029		struct block_device *bdev = ib_dev->ibd_bd;
  1030		const struct pr_ops *ops = bdev->bd_disk->fops->pr_ops;
  1031		struct pr_held_reservation rsv = { };
  1032	
  1033		if (!ops) {
  1034			pr_err("Block device does not support pr_ops but iblock device has been configured for PR passthrough.\n");
  1035			return TCM_UNSUPPORTED_SCSI_OPCODE;
  1036		}
  1037	
  1038		if (!ops->pr_read_reservation) {
  1039			pr_err("Block device does not support read_keys.\n");
  1040			return TCM_UNSUPPORTED_SCSI_OPCODE;
  1041		}
  1042	
  1043		if (ops->pr_read_reservation(bdev, &rsv))
  1044			return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
  1045	
  1046		put_unaligned_be32(rsv.generation, &param_data[0]);
  1047		if (!block_pr_type_to_scsi(rsv.type)) {
  1048			put_unaligned_be32(0, &param_data[4]);
  1049			return TCM_NO_SENSE;
  1050		}
  1051	
  1052		put_unaligned_be32(16, &param_data[4]);
  1053	
  1054		if (cmd->data_length < 16)
> 1055			return TCM_NO_SENSE;
  1056		put_unaligned_be64(rsv.key, &param_data[8]);
  1057	
  1058		if (cmd->data_length < 22)
  1059			return TCM_NO_SENSE;
  1060		param_data[21] = block_pr_type_to_scsi(rsv.type);
  1061	
  1062		return TCM_NO_SENSE;
  1063	}
  1064	
  1065	static sense_reason_t iblock_execute_pr_in(struct se_cmd *cmd, u8 sa,
  1066						   unsigned char *param_data)
  1067	{
  1068		sense_reason_t ret = TCM_NO_SENSE;
  1069	
  1070		switch (sa) {
  1071		case PRI_REPORT_CAPABILITIES:
  1072			iblock_pr_report_caps(param_data);
  1073			break;
  1074		case PRI_READ_KEYS:
> 1075			ret = iblock_pr_read_keys(cmd, param_data);
  1076			break;
  1077		case PRI_READ_RESERVATION:
  1078			ret = iblock_pr_read_reservation(cmd, param_data);
  1079			break;
  1080		default:
  1081			pr_err("Unknown PERSISTENT_RESERVE_IN SA: 0x%02x\n", sa);
  1082			return TCM_UNSUPPORTED_SCSI_OPCODE;
  1083		}
  1084	
  1085		return ret;
  1086	}
  1087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

