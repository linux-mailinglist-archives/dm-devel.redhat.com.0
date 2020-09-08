Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 154D52614C2
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 18:36:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-24Gz-jXbPYWgL3dfuDYfdg-1; Tue, 08 Sep 2020 12:36:23 -0400
X-MC-Unique: 24Gz-jXbPYWgL3dfuDYfdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B2E8030A5;
	Tue,  8 Sep 2020 16:36:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE8D5D9F3;
	Tue,  8 Sep 2020 16:36:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F2C27A001;
	Tue,  8 Sep 2020 16:36:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088GZvMg013972 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 12:35:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F435A37AD; Tue,  8 Sep 2020 16:35:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8975BA7FCC
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 16:35:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B037811E7A
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 16:35:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-558-0NuX1CnTNKux-V0I8SfEKQ-1;
	Tue, 08 Sep 2020 12:35:47 -0400
X-MC-Unique: 0NuX1CnTNKux-V0I8SfEKQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A6E2ACCC;
	Tue,  8 Sep 2020 16:35:47 +0000 (UTC)
Message-ID: <c50b9997b3c4a55d6a2858cd6b931bea93b14bfe.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng
	<lixiaokeng@huawei.com>
Date: Tue, 08 Sep 2020 18:35:45 +0200
In-Reply-To: <20200908154540.GK11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
	<20200904213048.GE11108@octiron.msp.redhat.com>
	<8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
	<20200908154540.GK11108@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel, list <dm-devel@redhat.com>, linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 10:45 -0500, Benjamin Marzinski wrote:
> On Mon, Sep 07, 2020 at 08:21:28PM +0800, lixiaokeng wrote:
> > > > @@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char *
> > > > params, int len)
> > > >  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
> > > >  		add_feature(&mp->features, retain_hwhandler);
> > > > 
> > > > -	f = STRDUP(mp->features);
> > > 
> > > clearly strdup()ing without checking if mp->features NULL is
> > > incorrect.
> > > However, I'm not sure that we need to fail if mp->features is
> > > NULL.
> > > instead, int the APPEND call, we could use the gcc ternary
> > > operator
> > > extension
> > > 
> > > (mp->features)?: "0"
> > > 
> > > to use "0" if mp->features is NULL.
> > > 
> > > Also, have you seen this actually occur?  Or is this just a
> > > theoretical
> > > issue that you've found from reading the code.  It seems like
> > > setup_map() will always call select_features() before calling
> > > assemble_map(), which should mean that mp->features will always
> > > be set
> > > in this case. Perhaps I'm missing something here.
> > > 
> > > -Ben
> > > 
> > Hi Ben,
> >   This just a theoretical issue and I did not see it. But it's not
> > necessary
> > to call strdup. In your opinion, need multipath be checked?  I will
> > make new
> > patch with your suggestion.
> 
> Since we don't believe it's possible for mp->features (or mp-
> >hwhandler)
> to be set to NULL here, it makes sense to print an error if it is
> NULL.
> So, I guess my suggestion would be to print an error message if
> mp->features or mp->hwhandler are NULL, but to assemble the map
> anyway,
> using the default value of "0" if they are NULL. That's how
> assemble_map() currently handles failures in add_feature().
> add_feature() will print an error, but assemble_map() will go ahead
> with
> assembling the map.
> 
> I'm willing to be convinced that there is a better solution, however.

What about this:

assemble_map() is only called from setup_map(), which sets mp->features 
in select_features(). So what we should do is check for NULL after
select_features(), or have that function return an error code if strdup
fails, and bail out early in setup_map() in that case.

Then we simply need to add a comment in assemble_map() saying that 
mp->features must be non-null when this function is called.

As I said earlier, I'm of course not against checking function
parameters, but here we should fail to setup a "struct multipath" in
the first place in setup map(), rather than returning an incompletely
initialized one. If we handle it this way, we don't need to check the
fields of struct multipath over and over again. Similar arguments hold
for other structs.

Of course this kind of assumption needs to be better documented in the
code.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

