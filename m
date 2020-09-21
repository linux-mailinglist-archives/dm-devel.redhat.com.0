Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D9245271D98
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 10:11:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-dy4URYfGO8CSJ3cr0daCKg-1; Mon, 21 Sep 2020 04:11:49 -0400
X-MC-Unique: dy4URYfGO8CSJ3cr0daCKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6258192C8A5;
	Mon, 21 Sep 2020 08:11:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0300778824;
	Mon, 21 Sep 2020 08:11:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA35E8C7AC;
	Mon, 21 Sep 2020 08:11:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L8BGDJ017962 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 04:11:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E82232018088; Mon, 21 Sep 2020 08:11:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2081201F30A
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:11:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7576D803521
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:11:13 +0000 (UTC)
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-408-mONRAXZAPdeRa-briydWpw-1;
	Mon, 21 Sep 2020 04:11:09 -0400
X-MC-Unique: mONRAXZAPdeRa-briydWpw-1
Received: from zn.tnic (p200300ec2f07e300bb1cec778fd9588d.dip0.t-ipconnect.de
	[IPv6:2003:ec:2f07:e300:bb1c:ec77:8fd9:588d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id
	25AA91EC0323; Mon, 21 Sep 2020 10:03:05 +0200 (CEST)
Date: Mon, 21 Sep 2020 10:02:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200921080258.GA5947@zn.tnic>
References: <20200921010359.GO3027113@arch-chirva.localdomain>
	<CA+G9fYtCg2KjdB2oBUDJ2DKAzUxq3u8ZnMY9Et-RG9Pnrmuf9w@mail.gmail.com>
	<20200921073218.GA3142611@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200921073218.GA3142611@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Dave Jiang <dave.jiang@intel.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Stuart Little <achirvasub@gmail.com>,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	mpatocka@redhat.com, Dan Williams <dan.j.williams@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel]
 =?utf-8?q?PROBLEM=3A_5=2E9=2E0-rc6_fails_to_compile_du?=
 =?utf-8?b?ZSB0byAncmVkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkn?=
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 21, 2020 at 09:32:18AM +0200, Greg KH wrote:
> all my local builds are breaking now too with this :(
> 
> Was there a proposed patch anywhere for this?

I've disabled CONFIG_BLK_DEV_PMEM which allowed me to de-select those
two:

# CONFIG_DAX is not set
# CONFIG_FS_DAX is not set

and now it at least builds.

In order to avoid such breakage in the future, I'd suggest you guys to
run randconfigs on your stuff before sending, especially if the Kconfig
ifdeffery is not a trivial one like the DAX maze.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

