Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F12B128
	for <lists+dm-devel@lfdr.de>; Sat, 27 Apr 2019 01:13:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F9811440A2;
	Fri, 26 Apr 2019 23:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 879B917134;
	Fri, 26 Apr 2019 23:13:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 989B5181B9E0;
	Fri, 26 Apr 2019 23:13:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3QNDEnU000620 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 19:13:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A46235D71C; Fri, 26 Apr 2019 23:13:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF825D70A;
	Fri, 26 Apr 2019 23:13:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B334130BEF0C;
	Fri, 26 Apr 2019 23:13:07 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Apr 2019 16:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,399,1549958400"; d="scan'208";a="341203744"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2019 16:13:05 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1hKA1h-000Gvy-Eu; Sat, 27 Apr 2019 07:13:05 +0800
Date: Sat, 27 Apr 2019 07:12:48 +0800
From: kbuild test robot <lkp@intel.com>
To: Bryan Gurney <bgurney@redhat.com>
Message-ID: <201904270727.g6e3MBmi%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Fri, 26 Apr 2019 23:13:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 26 Apr 2019 23:13:09 +0000 (UTC) for IP:'134.134.136.24'
	DOMAIN:'mga09.intel.com' HELO:'mga09.intel.com'
	FROM:'lkp@intel.com' RCPT:''
X-RedHat-Spam-Score: -5.001  (RCVD_IN_DNSWL_HI,
	SPF_PASS) 134.134.136.24 mga09.intel.com 134.134.136.24
	mga09.intel.com <lkp@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kbuild-all@01.org, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [dm:dm-5.2 22/22] drivers/md/dm-dust.c:35:17: sparse:
 sparse: symbol 'dust_rb_search' was not declared. Should it be static?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 26 Apr 2019 23:13:39 +0000 (UTC)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-5.2
head:   cefb8eb074c8cde87d4a6947e24c00b8cbde830c
commit: cefb8eb074c8cde87d4a6947e24c00b8cbde830c [22/22] dm: add dust target
reproduce:
        # apt-get install sparse
        git checkout cefb8eb074c8cde87d4a6947e24c00b8cbde830c
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/md/dm-dust.c:35:17: sparse: sparse: symbol 'dust_rb_search' was not declared. Should it be static?
>> drivers/md/dm-dust.c:53:6: sparse: sparse: symbol 'dust_rb_insert' was not declared. Should it be static?
>> drivers/md/dm-dust.c:495:12: sparse: sparse: symbol 'dm_dust_init' was not declared. Should it be static?
>> drivers/md/dm-dust.c:505:13: sparse: sparse: symbol 'dm_dust_exit' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
