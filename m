Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB97BD42
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F44130ADC87;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DE5960605;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08048180BA99;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6V3ofVJ013074 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 23:50:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4EDE19C67; Wed, 31 Jul 2019 03:50:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C145619C5B;
	Wed, 31 Jul 2019 03:50:36 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD39841F53;
	Wed, 31 Jul 2019 03:50:36 +0000 (UTC)
Date: Tue, 30 Jul 2019 23:50:36 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <1887039269.5822356.1564545036201.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190730190737.GA14873@redhat.com>
References: <20190730113708.14660-1-pagupta@redhat.com>
	<2030283543.5419072.1564486701158.JavaMail.zimbra@redhat.com>
	<20190730190737.GA14873@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.109, 10.4.195.28]
Thread-Topic: fix dax_dev NULL dereference
Thread-Index: t64YiHL2yO3dmKpuGShiDkq8uuDxtg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 05:34:14 -0400
Cc: jencce kernel <jencce.kernel@gmail.com>, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	dan j williams <dan.j.williams@intel.com>, agk@redhat.com
Subject: Re: [dm-devel] dm: fix dax_dev NULL dereference
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 31 Jul 2019 09:34:34 +0000 (UTC)


> 
> I staged the fix (which I tweaked) here:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.3&id=95b9ebb78c4c733f8912a195fbd0bc19960e726e
> 
> Also, please note this additional related commit that just serves to
> improve a related function name and clean up some whitespace:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.3&id=f965f935a89bb174fd3f6d6b51bba91c1ed258c5
> 
> I'll likely send these to Linus for 5.2-rc3 later this week.

o.k

Thank you,
Pankaj

> 
> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
