Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 651C225D95E
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 15:15:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-p6BwnaZnMOO6GNa555wgvQ-1; Fri, 04 Sep 2020 09:15:06 -0400
X-MC-Unique: p6BwnaZnMOO6GNa555wgvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE63D1091073;
	Fri,  4 Sep 2020 13:14:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E74D6FDB6;
	Fri,  4 Sep 2020 13:14:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D18BB79DBB;
	Fri,  4 Sep 2020 13:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084DE9bm003285 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 09:14:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05A702142F54; Fri,  4 Sep 2020 13:14:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F24D52142F4E
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 13:14:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65657101AA47
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 13:14:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-494-lDboKnzrOtG7J9P4apz9mQ-1;
	Fri, 04 Sep 2020 09:13:58 -0400
X-MC-Unique: lDboKnzrOtG7J9P4apz9mQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BF0F2AC85;
	Fri,  4 Sep 2020 13:13:57 +0000 (UTC)
Message-ID: <f0c1bcd45d81b3a00562b696121e4c08a37d6361.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Fri, 04 Sep 2020 15:13:55 +0200
In-Reply-To: <ef74857c-c81d-c0ec-4692-a9cd8299a99c@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<b1baac25-58c2-8f27-67bd-5d050fcdf8c7@huawei.com>
	<e525938e5b810958512eb623898fd732bd8482c4.camel@suse.com>
	<ef74857c-c81d-c0ec-4692-a9cd8299a99c@huawei.com>
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 01/14] multipathd: return if
 dm_get_major_minor failed in, cli_add_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-04 at 10:48 +0800, lixiaokeng wrote:
> 
> On 2020/9/4 1:26, Martin Wilck wrote:
> > Why not just quit the "do" loop in the error case
> > for dm_get_major_minor()?
> > 
> > Martin
> 
> If dm_get_major failed at first time, it will be executed again
> for some reason I don't know in the original code. Quiting the
> "do" loop in the error case for dm_get_major_minor() is against
> the twice attempt rule.

Right. 

Then, to solve the problem you're concerned about, it should be
sufficient to initialize both major and minor to -1, or simply refrain
from printing them in the log message in the first place.

At a closer look, the logic of the function is flawed; at least
if get_refwwid() doesn't return a usable refwwid, there's no point in
trying again.

Thanks,
Martin


> 
> Lixiaokeng
> > >  		else {
> > >  			sprintf(dev_path, "dm-%d", minor);
> > >  			alias = dm_mapname(major, minor);
> > > +			if (!alias)
> > > +				condlog(2, "%s: mapname not found for
> > > %d:%d",
> > > +					param, major, minor);
> > >  		}
> > >  		/*if there is no mapname found, we first create the
> > > device*/
> > >  		if (!alias && !count) {
> > > -			condlog(2, "%s: mapname not found for %d:%d",
> > > -				param, major, minor);
> > >  			get_refwwid(CMD_NONE, param, DEV_DEVMAP,
> > >  				    vecs->pathvec, &refwwid);
> > >  			if (refwwid) {
> > 
> > 
> > .
> > 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

