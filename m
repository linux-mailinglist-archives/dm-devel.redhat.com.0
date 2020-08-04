Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8E91023C132
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 23:09:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-qXXV_pQhOumzxMWcjToeOQ-1; Tue, 04 Aug 2020 17:09:01 -0400
X-MC-Unique: qXXV_pQhOumzxMWcjToeOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BA28101C8A0;
	Tue,  4 Aug 2020 21:08:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B399E19D7E;
	Tue,  4 Aug 2020 21:08:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9077F96901;
	Tue,  4 Aug 2020 21:08:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074L8Oqp030821 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 17:08:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E78832156709; Tue,  4 Aug 2020 21:08:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E356D2156708
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 21:08:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00133100CF85
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 21:08:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-238-C8mV28VePeqgISCGgofe6g-1;
	Tue, 04 Aug 2020 17:08:16 -0400
X-MC-Unique: C8mV28VePeqgISCGgofe6g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 62952B142;
	Tue,  4 Aug 2020 21:08:31 +0000 (UTC)
Message-ID: <6fdb676e4ff63e4ea6f986e9a3a7401da6a27bae.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 04 Aug 2020 23:08:14 +0200
In-Reply-To: <20200720203023.GC11089@octiron.msp.redhat.com>
References: <20200709103513.8142-1-mwilck@suse.com>
	<20200720203023.GC11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
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
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/42] multipath-tools series part III:
	duplicate alias
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 15:30 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:35:10PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Hi Christophe, hi Ben,
> > 
> > This is part II of a larger patch series for multpath-tools I've
> > been preparing.
> > It contains fixes for a customer issue where the same alias was set
> > for
> > several maps with different WWIDs in the WWIDs file.
> > 
> > It's based on the previously submitted part II.
> > 
> > The full series will also be available here:
> > https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> > 
> > There are tags in that repo for each part of the series.
> > This part is tagged "submit-200709-3".
> 
> With the first two of these patches applied , multipathd fails a
> real-world situation in different, arguably worse, way than it
> currently
> does, and I think it could do better.  If user_friendly_names is set,
> but two (or more) devices weren't in the initramfs bindings file,
> they
> will get random aliases during boot.  Assuming the devices are in the
> regular filesystem bindings file, it's not super uncommon for these
> devices to pick from the same alias as they use in the regular
> bindings
> file, but with different wwids matching to different aliases.
> 
> Without these patches, multipath will rename them if possible, but if
> not, they will still exist, but with the wrong alias. Existing with
> the
> wrong alias isn't great, since things could be checking for the
> devices
> by name, which could cause corruption. 

Indeed I didn't think of this scenario.

The problem our customer faced was actually an evil case of data
corruption which must be avoided. But you're right, my attempt to fix
it was wrong.

> But in reality, usually they are
> referenced by Labels, which will still work (since most things are
> designed to not expect persistent naming of devices).  However, with
> this patches, some of the devices will be deleted, which avoids the
> possiblity of corruption, but in practice usually is worse because
> referencing devices by label already avoids the corruption problem. 
> 
> A better idea might simply be to fallback to using the WWID as an
> alias,
> on the offending map.  This should avoid corruption, since unless
> someone manually set the WWID as an alias in multipath.conf it should
> be
> unique. But it won't cause an existing, and possibly necessary,
> device
> to get deleted.

Ok, I'm going to try to come up with a version that doesn't suffer from
the problem you describe. I'll have to ponder about it some more.

Thanks for pointing this out,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

