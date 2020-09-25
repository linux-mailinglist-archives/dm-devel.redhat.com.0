Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAD5627918E
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 21:53:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-ylYHyyyVPlCN6mD9Vskgug-1; Fri, 25 Sep 2020 15:53:35 -0400
X-MC-Unique: ylYHyyyVPlCN6mD9Vskgug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 295A780B727;
	Fri, 25 Sep 2020 19:53:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FCFA5D9F1;
	Fri, 25 Sep 2020 19:53:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E29C1826D2B;
	Fri, 25 Sep 2020 19:53:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PJqxBf019645 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 15:52:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A323B2166B27; Fri, 25 Sep 2020 19:52:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E6042166BA0
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 19:52:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C3608007D9
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 19:52:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-164-RFQHjkhYMmiHEsW3zMfmSw-1;
	Fri, 25 Sep 2020 15:52:54 -0400
X-MC-Unique: RFQHjkhYMmiHEsW3zMfmSw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 96ABBAD52;
	Fri, 25 Sep 2020 19:52:52 +0000 (UTC)
Message-ID: <d41328cd56bc65f9506d9a7f7548593aa07d775a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 25 Sep 2020 21:52:51 +0200
In-Reply-To: <20200925040034.GN11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-11-mwilck@suse.com>
	<20200925040034.GN11108@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 10/11] libmpathpersist: add linker version
	script
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-24 at 23:00 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 03:36:43PM +0200, mwilck@suse.com wrote:
> > 
> > --- /dev/null
> > +++ b/libmpathpersist/libmpathpersist.version
> > @@ -0,0 +1,20 @@
> > +LIBMPATHPERSIST_0.8.4.0 {
> 
> I have a question about this version. Do you plan on bumping this
> each
> time a new release is tagged? It seems like we only ever want to
> change
> the version if we actually change the ABI. Or is 0.8.4 just because
> that's the relesae where we started this?

That was the idea, yes. And the last digit is because we'll have to
bump it between releases from Christophe. It makes sense for
libmultipath's rapidly changing ABI; much less so for libmpathcmd and
libmpathpersist, which are meant to be stable. I am open for discussing
these numbers; if you prefer, we might as well use LIBMPATHPERSIST_1.0.

I admit I haven't thought about what would happen once Christophe makes
a new release. Probably, nothing - afaics it's impossible to add a new
version without any new symbols, and *renaming* an existing version is
bad; it would introduce artificial incompatibility. 

So libmultipath from multipath-tools 0.8.5 would still have a 0.8.4.x
ABI; only the first change after 0.8.5 would get a 0.8.5.1 number. Hm.

Again, I'm open for discussion here. We might as well choose to not tie
the ABI version to the libmultipath version at all, and simply start at
0.1 or whatevever for libmultipath. After all, looking up the ABI
version in the commit history will be simple enough.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

