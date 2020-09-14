Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 898D2269463
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 20:07:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-GPeITjYENnanGEPRiQ2zqg-1; Mon, 14 Sep 2020 14:07:51 -0400
X-MC-Unique: GPeITjYENnanGEPRiQ2zqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FAC1074642;
	Mon, 14 Sep 2020 18:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D67245DE81;
	Mon, 14 Sep 2020 18:07:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B83EA1832FE5;
	Mon, 14 Sep 2020 18:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08EI7KKe017512 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 14:07:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5519E2166B44; Mon, 14 Sep 2020 18:07:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F5A52166B28
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 18:07:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF348800260
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 18:07:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-542-rc8k3RnTOEGGWruhDnyg0g-1;
	Mon, 14 Sep 2020 14:07:13 -0400
X-MC-Unique: rc8k3RnTOEGGWruhDnyg0g-1
IronPort-SDR: TQ6yGWbBL9jCBSjWIpigEJCNAvG6WgS0xR9U3+Vv1MU6LZ2WPmWqieRIT3e5Rwl/xEHSX1xsT7
	446vRXYQrfWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="138640711"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
	d="gz'50?scan'50,208,50";a="138640711"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	14 Sep 2020 11:06:08 -0700
IronPort-SDR: ooohhaqs/iepvoZ3yNVSpTJIJOmwaKrMSvy864tDw1kim2Jl2wS8CU47j9i4kH7Bro7PmhhfuF
	GuE5jg81QHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
	d="gz'50?scan'50,208,50";a="287699681"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
	by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2020 11:06:05 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1kHsrc-00018u-Vk; Mon, 14 Sep 2020 18:06:04 +0000
Date: Tue, 15 Sep 2020 02:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Message-ID: <202009150108.OqsW2U3q%lkp@intel.com>
References: <20200914041749.3702000-1-liushixin2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200914041749.3702000-1-liushixin2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Liu Shixin <liushixin2@huawei.com>, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH -next] dm integrity: convert to use
	le64_add_cpu()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200911]

url:    https://github.com/0day-ci/linux/commits/Liu-Shixin/dm-integrity-convert-to-use-le64_add_cpu/20200914-115650
base:    d5b2251d63b5344ee827d3680fa79bdb9f9ddfa1
config: x86_64-randconfig-s022-20200914 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/md/dm-integrity.c:2672:25: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:2712:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sector_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2712:25: sparse:     expected unsigned int [usertype] sector_hi
   drivers/md/dm-integrity.c:2712:25: sparse:     got restricted __le32 [usertype]
   drivers/md/dm-integrity.c:2784:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:2945:31: sparse: sparse: invalid assignment: &=
   drivers/md/dm-integrity.c:2945:31: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:2945:31: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:2960:43: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:2977:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] provided_data_sectors @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2977:47: sparse:     expected unsigned long long [usertype] provided_data_sectors
   drivers/md/dm-integrity.c:2977:47: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:2983:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:2993:55: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:2993:55: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:2993:55: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:2994:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2994:63: sparse:     expected unsigned long long [usertype] recalc_sector
   drivers/md/dm-integrity.c:2994:63: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3005:47: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:3005:47: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3005:47: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3006:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3006:55: sparse:     expected unsigned long long [usertype] recalc_sector
   drivers/md/dm-integrity.c:3006:55: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3011:47: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:3011:47: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3011:47: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3012:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3012:55: sparse:     expected unsigned long long [usertype] recalc_sector
   drivers/md/dm-integrity.c:3012:55: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3016:39: sparse: sparse: invalid assignment: &=
   drivers/md/dm-integrity.c:3016:39: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3016:39: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3024:39: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:3024:39: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3024:39: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3033:45: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3034:29: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3035:66: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3036:77: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3037:72: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3038:77: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3039:75: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3040:77: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3048:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3049:36: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3054:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3054:47: sparse:     expected unsigned long long [usertype] recalc_sector
   drivers/md/dm-integrity.c:3054:47: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3082:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3083:25: sparse: sparse: cast to restricted __le64
   drivers/md/dm-integrity.c:3095:49: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3104:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3111:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3126:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3171:32: sparse: sparse: cast to restricted __le32
   drivers/md/dm-integrity.c:3175:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3198:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:3253:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] integrity_tag_size @@     got restricted __le16 [usertype] @@
   drivers/md/dm-integrity.c:3253:36: sparse:     expected unsigned short [usertype] integrity_tag_size
   drivers/md/dm-integrity.c:3253:36: sparse:     got restricted __le16 [usertype]
   drivers/md/dm-integrity.c:3256:31: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:3256:31: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3256:31: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3265:39: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:3265:39: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:3265:39: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:3266:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] journal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3266:42: sparse:     expected unsigned int [usertype] journal_sections
   drivers/md/dm-integrity.c:3266:42: sparse:     got restricted __le32 [usertype]
   drivers/md/dm-integrity.c:3284:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] journal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3284:42: sparse:     expected unsigned int [usertype] journal_sections
   drivers/md/dm-integrity.c:3284:42: sparse:     got restricted __le32 [usertype]
   drivers/md/dm-integrity.c:3286:55: sparse: sparse: cast to restricted __le32
   drivers/md/dm-integrity.c:3290:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] journal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3290:50: sparse:     expected unsigned int [usertype] journal_sections
   drivers/md/dm-integrity.c:3290:50: sparse:     got restricted __le32 [usertype]
   drivers/md/dm-integrity.c:3292:58: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] journal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3292:58: sparse:     expected unsigned int [usertype] journal_sections
   drivers/md/dm-integrity.c:3292:58: sparse:     got restricted __le32 [usertype]
   drivers/md/dm-integrity.c:3295:22: sparse: sparse: cast to restricted __le32
   drivers/md/dm-integrity.c:3304:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] provided_data_sectors @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3304:39: sparse:     expected unsigned long long [usertype] provided_data_sectors
   drivers/md/dm-integrity.c:3304:39: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3496:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3496:27: sparse:     expected unsigned long long
   drivers/md/dm-integrity.c:3496:27: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3497:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3497:27: sparse:     expected unsigned long long
   drivers/md/dm-integrity.c:3497:27: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3498:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3498:27: sparse:     expected unsigned long long
   drivers/md/dm-integrity.c:3498:27: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3499:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3499:27: sparse:     expected unsigned long long
   drivers/md/dm-integrity.c:3499:27: sparse:     got restricted __le64 [usertype]
   drivers/md/dm-integrity.c:3653:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] section_le @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3653:52: sparse:     expected unsigned int [usertype] section_le
   drivers/md/dm-integrity.c:3653:52: sparse:     got restricted __le32 [usertype]
>> drivers/md/dm-integrity.c:3699:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le64 [usertype] *var @@     got unsigned long long * @@
>> drivers/md/dm-integrity.c:3699:61: sparse:     expected restricted __le64 [usertype] *var
>> drivers/md/dm-integrity.c:3699:61: sparse:     got unsigned long long *
   drivers/md/dm-integrity.c:4066:13: sparse: sparse: cast to restricted __le16
   drivers/md/dm-integrity.c:4076:14: sparse: sparse: cast to restricted __le32
   drivers/md/dm-integrity.c:4096:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:4174:55: sparse: sparse: restricted __le32 degrades to integer
   drivers/md/dm-integrity.c:4175:31: sparse: sparse: invalid assignment: |=
   drivers/md/dm-integrity.c:4175:31: sparse:    left side has type unsigned int
   drivers/md/dm-integrity.c:4175:31: sparse:    right side has type restricted __le32
   drivers/md/dm-integrity.c:4176:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:4176:39: sparse:     expected unsigned long long [usertype] recalc_sector
   drivers/md/dm-integrity.c:4176:39: sparse:     got restricted __le64 [usertype]

# https://github.com/0day-ci/linux/commit/d0fe72210efe84e8e9c90b1650eb8a5728378dbe
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Liu-Shixin/dm-integrity-convert-to-use-le64_add_cpu/20200914-115650
git checkout d0fe72210efe84e8e9c90b1650eb8a5728378dbe
vim +3699 drivers/md/dm-integrity.c

  3487	
  3488	static int create_journal(struct dm_integrity_c *ic, char **error)
  3489	{
  3490		int r = 0;
  3491		unsigned i;
  3492		__u64 journal_pages, journal_desc_size, journal_tree_size;
  3493		unsigned char *crypt_data = NULL, *crypt_iv = NULL;
  3494		struct skcipher_request *req = NULL;
  3495	
  3496		ic->commit_ids[0] = cpu_to_le64(0x1111111111111111ULL);
  3497		ic->commit_ids[1] = cpu_to_le64(0x2222222222222222ULL);
  3498		ic->commit_ids[2] = cpu_to_le64(0x3333333333333333ULL);
  3499		ic->commit_ids[3] = cpu_to_le64(0x4444444444444444ULL);
  3500	
  3501		journal_pages = roundup((__u64)ic->journal_sections * ic->journal_section_sectors,
  3502					PAGE_SIZE >> SECTOR_SHIFT) >> (PAGE_SHIFT - SECTOR_SHIFT);
  3503		journal_desc_size = journal_pages * sizeof(struct page_list);
  3504		if (journal_pages >= totalram_pages() - totalhigh_pages() || journal_desc_size > ULONG_MAX) {
  3505			*error = "Journal doesn't fit into memory";
  3506			r = -ENOMEM;
  3507			goto bad;
  3508		}
  3509		ic->journal_pages = journal_pages;
  3510	
  3511		ic->journal = dm_integrity_alloc_page_list(ic->journal_pages);
  3512		if (!ic->journal) {
  3513			*error = "Could not allocate memory for journal";
  3514			r = -ENOMEM;
  3515			goto bad;
  3516		}
  3517		if (ic->journal_crypt_alg.alg_string) {
  3518			unsigned ivsize, blocksize;
  3519			struct journal_completion comp;
  3520	
  3521			comp.ic = ic;
  3522			ic->journal_crypt = crypto_alloc_skcipher(ic->journal_crypt_alg.alg_string, 0, 0);
  3523			if (IS_ERR(ic->journal_crypt)) {
  3524				*error = "Invalid journal cipher";
  3525				r = PTR_ERR(ic->journal_crypt);
  3526				ic->journal_crypt = NULL;
  3527				goto bad;
  3528			}
  3529			ivsize = crypto_skcipher_ivsize(ic->journal_crypt);
  3530			blocksize = crypto_skcipher_blocksize(ic->journal_crypt);
  3531	
  3532			if (ic->journal_crypt_alg.key) {
  3533				r = crypto_skcipher_setkey(ic->journal_crypt, ic->journal_crypt_alg.key,
  3534							   ic->journal_crypt_alg.key_size);
  3535				if (r) {
  3536					*error = "Error setting encryption key";
  3537					goto bad;
  3538				}
  3539			}
  3540			DEBUG_print("cipher %s, block size %u iv size %u\n",
  3541				    ic->journal_crypt_alg.alg_string, blocksize, ivsize);
  3542	
  3543			ic->journal_io = dm_integrity_alloc_page_list(ic->journal_pages);
  3544			if (!ic->journal_io) {
  3545				*error = "Could not allocate memory for journal io";
  3546				r = -ENOMEM;
  3547				goto bad;
  3548			}
  3549	
  3550			if (blocksize == 1) {
  3551				struct scatterlist *sg;
  3552	
  3553				req = skcipher_request_alloc(ic->journal_crypt, GFP_KERNEL);
  3554				if (!req) {
  3555					*error = "Could not allocate crypt request";
  3556					r = -ENOMEM;
  3557					goto bad;
  3558				}
  3559	
  3560				crypt_iv = kzalloc(ivsize, GFP_KERNEL);
  3561				if (!crypt_iv) {
  3562					*error = "Could not allocate iv";
  3563					r = -ENOMEM;
  3564					goto bad;
  3565				}
  3566	
  3567				ic->journal_xor = dm_integrity_alloc_page_list(ic->journal_pages);
  3568				if (!ic->journal_xor) {
  3569					*error = "Could not allocate memory for journal xor";
  3570					r = -ENOMEM;
  3571					goto bad;
  3572				}
  3573	
  3574				sg = kvmalloc_array(ic->journal_pages + 1,
  3575						    sizeof(struct scatterlist),
  3576						    GFP_KERNEL);
  3577				if (!sg) {
  3578					*error = "Unable to allocate sg list";
  3579					r = -ENOMEM;
  3580					goto bad;
  3581				}
  3582				sg_init_table(sg, ic->journal_pages + 1);
  3583				for (i = 0; i < ic->journal_pages; i++) {
  3584					char *va = lowmem_page_address(ic->journal_xor[i].page);
  3585					clear_page(va);
  3586					sg_set_buf(&sg[i], va, PAGE_SIZE);
  3587				}
  3588				sg_set_buf(&sg[i], &ic->commit_ids, sizeof ic->commit_ids);
  3589	
  3590				skcipher_request_set_crypt(req, sg, sg,
  3591							   PAGE_SIZE * ic->journal_pages + sizeof ic->commit_ids, crypt_iv);
  3592				init_completion(&comp.comp);
  3593				comp.in_flight = (atomic_t)ATOMIC_INIT(1);
  3594				if (do_crypt(true, req, &comp))
  3595					wait_for_completion(&comp.comp);
  3596				kvfree(sg);
  3597				r = dm_integrity_failed(ic);
  3598				if (r) {
  3599					*error = "Unable to encrypt journal";
  3600					goto bad;
  3601				}
  3602				DEBUG_bytes(lowmem_page_address(ic->journal_xor[0].page), 64, "xor data");
  3603	
  3604				crypto_free_skcipher(ic->journal_crypt);
  3605				ic->journal_crypt = NULL;
  3606			} else {
  3607				unsigned crypt_len = roundup(ivsize, blocksize);
  3608	
  3609				req = skcipher_request_alloc(ic->journal_crypt, GFP_KERNEL);
  3610				if (!req) {
  3611					*error = "Could not allocate crypt request";
  3612					r = -ENOMEM;
  3613					goto bad;
  3614				}
  3615	
  3616				crypt_iv = kmalloc(ivsize, GFP_KERNEL);
  3617				if (!crypt_iv) {
  3618					*error = "Could not allocate iv";
  3619					r = -ENOMEM;
  3620					goto bad;
  3621				}
  3622	
  3623				crypt_data = kmalloc(crypt_len, GFP_KERNEL);
  3624				if (!crypt_data) {
  3625					*error = "Unable to allocate crypt data";
  3626					r = -ENOMEM;
  3627					goto bad;
  3628				}
  3629	
  3630				ic->journal_scatterlist = dm_integrity_alloc_journal_scatterlist(ic, ic->journal);
  3631				if (!ic->journal_scatterlist) {
  3632					*error = "Unable to allocate sg list";
  3633					r = -ENOMEM;
  3634					goto bad;
  3635				}
  3636				ic->journal_io_scatterlist = dm_integrity_alloc_journal_scatterlist(ic, ic->journal_io);
  3637				if (!ic->journal_io_scatterlist) {
  3638					*error = "Unable to allocate sg list";
  3639					r = -ENOMEM;
  3640					goto bad;
  3641				}
  3642				ic->sk_requests = kvmalloc_array(ic->journal_sections,
  3643								 sizeof(struct skcipher_request *),
  3644								 GFP_KERNEL | __GFP_ZERO);
  3645				if (!ic->sk_requests) {
  3646					*error = "Unable to allocate sk requests";
  3647					r = -ENOMEM;
  3648					goto bad;
  3649				}
  3650				for (i = 0; i < ic->journal_sections; i++) {
  3651					struct scatterlist sg;
  3652					struct skcipher_request *section_req;
  3653					__u32 section_le = cpu_to_le32(i);
  3654	
  3655					memset(crypt_iv, 0x00, ivsize);
  3656					memset(crypt_data, 0x00, crypt_len);
  3657					memcpy(crypt_data, &section_le, min((size_t)crypt_len, sizeof(section_le)));
  3658	
  3659					sg_init_one(&sg, crypt_data, crypt_len);
  3660					skcipher_request_set_crypt(req, &sg, &sg, crypt_len, crypt_iv);
  3661					init_completion(&comp.comp);
  3662					comp.in_flight = (atomic_t)ATOMIC_INIT(1);
  3663					if (do_crypt(true, req, &comp))
  3664						wait_for_completion(&comp.comp);
  3665	
  3666					r = dm_integrity_failed(ic);
  3667					if (r) {
  3668						*error = "Unable to generate iv";
  3669						goto bad;
  3670					}
  3671	
  3672					section_req = skcipher_request_alloc(ic->journal_crypt, GFP_KERNEL);
  3673					if (!section_req) {
  3674						*error = "Unable to allocate crypt request";
  3675						r = -ENOMEM;
  3676						goto bad;
  3677					}
  3678					section_req->iv = kmalloc_array(ivsize, 2,
  3679									GFP_KERNEL);
  3680					if (!section_req->iv) {
  3681						skcipher_request_free(section_req);
  3682						*error = "Unable to allocate iv";
  3683						r = -ENOMEM;
  3684						goto bad;
  3685					}
  3686					memcpy(section_req->iv + ivsize, crypt_data, ivsize);
  3687					section_req->cryptlen = (size_t)ic->journal_section_sectors << SECTOR_SHIFT;
  3688					ic->sk_requests[i] = section_req;
  3689					DEBUG_bytes(crypt_data, ivsize, "iv(%u)", i);
  3690				}
  3691			}
  3692		}
  3693	
  3694		for (i = 0; i < N_COMMIT_IDS; i++) {
  3695			unsigned j;
  3696	retest_commit_id:
  3697			for (j = 0; j < i; j++) {
  3698				if (ic->commit_ids[j] == ic->commit_ids[i]) {
> 3699					le64_add_cpu(&ic->commit_ids[i], 1);
  3700					goto retest_commit_id;
  3701				}
  3702			}
  3703			DEBUG_print("commit id %u: %016llx\n", i, ic->commit_ids[i]);
  3704		}
  3705	
  3706		journal_tree_size = (__u64)ic->journal_entries * sizeof(struct journal_node);
  3707		if (journal_tree_size > ULONG_MAX) {
  3708			*error = "Journal doesn't fit into memory";
  3709			r = -ENOMEM;
  3710			goto bad;
  3711		}
  3712		ic->journal_tree = kvmalloc(journal_tree_size, GFP_KERNEL);
  3713		if (!ic->journal_tree) {
  3714			*error = "Could not allocate memory for journal tree";
  3715			r = -ENOMEM;
  3716		}
  3717	bad:
  3718		kfree(crypt_data);
  3719		kfree(crypt_iv);
  3720		skcipher_request_free(req);
  3721	
  3722		return r;
  3723	}
  3724	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--sdtB3X0nJg68CQEu--

