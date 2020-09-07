Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9697025FC24
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 16:33:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-1uDj6yd5NJi0CjV9WMJuXg-1; Mon, 07 Sep 2020 10:33:54 -0400
X-MC-Unique: 1uDj6yd5NJi0CjV9WMJuXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17D6A56B2A;
	Mon,  7 Sep 2020 14:33:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52F045C26A;
	Mon,  7 Sep 2020 14:33:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34A1779FE6;
	Mon,  7 Sep 2020 14:33:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087EXN3F028200 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 10:33:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8C241111A61; Mon,  7 Sep 2020 14:33:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3B321111A60
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 14:33:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50575811E79
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 14:33:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-488-rbRHlx7NOLmR2WeoxD8TQg-1;
	Mon, 07 Sep 2020 10:33:18 -0400
X-MC-Unique: rbRHlx7NOLmR2WeoxD8TQg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 757A5AE95;
	Mon,  7 Sep 2020 14:33:17 +0000 (UTC)
Message-ID: <1249b66af15efd82f3e37835d74f18a1c5398a73.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng
	<lixiaokeng@huawei.com>
Date: Mon, 07 Sep 2020 16:33:15 +0200
In-Reply-To: <20200905000501.GH11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5beca982-98a1-e48b-f86f-95810bc3c49c@huawei.com>
	<20200905000501.GH11108@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel, list <dm-devel@redhat.com>, linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 12/14] libmultipathpersist: use
 update_multipath_table/status, in get_mpvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-04 at 19:05 -0500, Benjamin Marzinski wrote:
> On Wed, Sep 02, 2020 at 03:24:33PM +0800, lixiaokeng wrote:
> > The return values of dm_get_map, disassemble_map in get_mpvec
> > were not checked. Use update_multipath_table/status to instead
> > of them.
> > 
> 
> Looks mostly good. I agree that we should be checking the results of
> getting the raw data before we try to disassemble it. But, there's
> not
> really any point to calling continue as the last operation of a loop.
> Perhaps
> 
> if (update_multipath_table(mpp, pathvec, DI_CHECKER) == DMP_OK)
> 	update_multipath_status(mpp);
> 
> makes more sense.

I was thinking about this before, and wondered whether we should call
remove_map() here if we encounter an error. Looking at it again and
comparing with get_dm_mpvec(), I think we should.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

