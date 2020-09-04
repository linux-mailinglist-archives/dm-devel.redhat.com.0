Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE9F25E348
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 23:28:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-GdtdQCsJOrq4TCMKU-u4mA-1; Fri, 04 Sep 2020 17:28:47 -0400
X-MC-Unique: GdtdQCsJOrq4TCMKU-u4mA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E381005E67;
	Fri,  4 Sep 2020 21:28:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C8760C05;
	Fri,  4 Sep 2020 21:28:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32FA218561B2;
	Fri,  4 Sep 2020 21:28:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LSSeO023709 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:28:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 710172166BB3; Fri,  4 Sep 2020 21:28:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CAEB2166BA3
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 21:28:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C289811E76
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 21:28:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-170-wRKQw98VOMq-jP7WyLB55w-1;
	Fri, 04 Sep 2020 17:28:23 -0400
X-MC-Unique: wRKQw98VOMq-jP7WyLB55w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 03A14AD19;
	Fri,  4 Sep 2020 21:28:23 +0000 (UTC)
Message-ID: <2e64d235b13042a015c7d1df63f6fd8222c85182.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 04 Sep 2020 23:28:21 +0200
In-Reply-To: <20200904200032.GB11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
	<20200904200032.GB11108@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
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
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>, "liuzhiqiang
	\(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 00/14] multipath-tools series: some cleanups
 and fixes checked by codedex tool
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-04 at 15:00 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 03, 2020 at 10:08:53PM +0200, Martin Wilck wrote:
> > Hello Lixiaokeng,
> > 
> > On Wed, 2020-09-02 at 14:40 +0800, lixiaokeng wrote:
> > > Hi:
> > >     Now, we check multipath-tools codes with codedex tool. Here
> > > are some some cleanups and fixes.
> > 
> > Thank you. However I'm going to nack all patches that add error
> > messages after unsuccesful memory allocations. Such messages are
> > unhelpful most of the time, and increase the code size without a
> > true
> > benefit. I've actually considered to get rid of all these, and
> > replace
> > them by a log_oom() macro.
> 
> O.k. This answers my question from patch 0005. I'm fine with this.

Great, thanks.

> As a side note: man, those are some ugly preprocessor hoops you need
> to
> jump through to stringify __LINE__.

Yeah, it took me some attempts to get it right. 
It's actually documented:
https://gcc.gnu.org/onlinedocs/gcc-4.8.5/cpp/Stringification.html

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

