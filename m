Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5E6F250C
	for <lists+dm-devel@lfdr.de>; Sat, 29 Apr 2023 16:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682778508;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uzlhn7HkSKShaR0WWxlJozJF6Z6PRMXhOnQ3xEOc28M=;
	b=bMgmvOhuaB+q5WEKiS/c0jgG9bMH1uXu5Bc3j96CSXpc5gJHF8uOzYQKrucXw19/4rpKaF
	Me5lMYnv0TRRCFGaQZUGaCNg+qNq3jn9oTzkC1MZBfeTbY3pF8kIlRPnjYvDy4lyWBZp9P
	P3ez/z3GbXdlm0/UAlzZyRTg2DxBxyw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-_0JyhfErOeWRm9R-Vv_upg-1; Sat, 29 Apr 2023 10:28:24 -0400
X-MC-Unique: _0JyhfErOeWRm9R-Vv_upg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD1F8185A790;
	Sat, 29 Apr 2023 14:28:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 439131121314;
	Sat, 29 Apr 2023 14:28:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EAFF41946A51;
	Sat, 29 Apr 2023 14:28:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9EF831946586
 for <dm-devel@listman.corp.redhat.com>; Sat, 29 Apr 2023 14:28:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E2B851E3; Sat, 29 Apr 2023 14:28:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36EF463F40
 for <dm-devel@redhat.com>; Sat, 29 Apr 2023 14:28:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A163800B35
 for <dm-devel@redhat.com>; Sat, 29 Apr 2023 14:28:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-4Pxcs1JKOqGBp09O311z6A-1; Sat, 29 Apr 2023 10:28:08 -0400
X-MC-Unique: 4Pxcs1JKOqGBp09O311z6A-1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="346729450"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; d="scan'208";a="346729450"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2023 07:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="697944304"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; d="scan'208";a="697944304"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 07:28:05 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pslYS-0001CH-2G;
 Sat, 29 Apr 2023 14:28:04 +0000
Date: Sat, 29 Apr 2023 22:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, shinichiro@fastmail.com,
 snitzer@kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com
Message-ID: <202304292230.Ai7aIFbo-lkp@intel.com>
References: <20230427024126.1417646-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20230427024126.1417646-1-yukuai1@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH blktests v2] tests/dm: add a regression test
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/tests-dm-add-a-regression-test/20230427-104508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20230427024126.1417646-1-yukuai1%40huaweicloud.com
patch subject: [PATCH blktests v2] tests/dm: add a regression test
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292230.Ai7aIFbo-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> tests/dm/001: 2:27 Invalid License ID: GPL-3.0+
>> tests/dm/rc: 2:27 Invalid License ID: GPL-3.0+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

