Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E28B72445FD
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:52:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-ifUrs51fPked3RdV1ZOsGw-1; Fri, 14 Aug 2020 03:52:36 -0400
X-MC-Unique: ifUrs51fPked3RdV1ZOsGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5ED1854FC2;
	Fri, 14 Aug 2020 07:52:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34D5419646;
	Fri, 14 Aug 2020 07:52:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B616B4A7DB;
	Fri, 14 Aug 2020 07:52:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E7pHZq012364 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 03:51:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55EF21006503; Fri, 14 Aug 2020 07:51:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51FB4110C56E
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:51:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 979FD101A540
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:51:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-194-p_dN5Zd3NlGHjdQrZkxDjg-1;
	Fri, 14 Aug 2020 03:51:12 -0400
X-MC-Unique: p_dN5Zd3NlGHjdQrZkxDjg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 02431ABE2;
	Fri, 14 Aug 2020 07:51:34 +0000 (UTC)
Message-ID: <cff0150ba981151a9db33bc6f1d4dd2982e0c425.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 14 Aug 2020 09:51:10 +0200
In-Reply-To: <c8468d0333f188f652de5c437baf91978ffcd432.camel@suse.com>
References: <20200812113405.26206-1-mwilck@suse.com>
	<20200812113405.26206-3-mwilck@suse.com>
	<20200813222359.GY19233@octiron.msp.redhat.com>
	<c8468d0333f188f652de5c437baf91978ffcd432.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 41/42] libmultipath: refuse reloading an
 existing map with different WWID
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-14 at 09:48 +0200, Martin Wilck wrote:
> Hi Ben,
> 
> On Thu, 2020-08-13 at 17:23 -0500, Benjamin Marzinski wrote:
> > 
> > I'm
> > also open to convinced that it would be o.k. to rename a device
> > that
> > we
> > weren't planing on reloading, because it has a wrong alias, which
> > messes
> > with the device that we were supposed to reload (I assume this
> > makes
> > the
> > code easier). Does that sound like a reasonable solution?
> 
> I sounds ok.

s/I/It/ - sorry.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

