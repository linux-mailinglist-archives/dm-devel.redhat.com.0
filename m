Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAFF279830
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 11:44:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-rM6T2pDsNgGMStywb5SlHQ-1; Sat, 26 Sep 2020 05:44:32 -0400
X-MC-Unique: rM6T2pDsNgGMStywb5SlHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05232807324;
	Sat, 26 Sep 2020 09:44:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FD97367E;
	Sat, 26 Sep 2020 09:44:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78DE744A4C;
	Sat, 26 Sep 2020 09:44:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08Q9hsX1008608 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 05:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFFCA2156A2D; Sat, 26 Sep 2020 09:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3792166B44
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 09:43:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3A6285828F
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 09:43:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-588-p0zehuEvMj2TSCGNbhGMAw-1;
	Sat, 26 Sep 2020 05:43:48 -0400
X-MC-Unique: p0zehuEvMj2TSCGNbhGMAw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D9B2CAD52;
	Sat, 26 Sep 2020 09:43:46 +0000 (UTC)
Message-ID: <91ed445c926ecf1fae57b8b0d7478f6b3401460c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 26 Sep 2020 11:43:46 +0200
In-Reply-To: <20200925215739.GA3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-14-mwilck@suse.com>
	<20200925043458.GO11108@octiron.msp.redhat.com>
	<e0637cd84ca36dbba00f8ff5b92ffcb8e81aa747.camel@suse.com>
	<20200925215739.GA3384@octiron.msp.redhat.com>
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
Subject: Re: [dm-devel] [PATCH v2 13/21] libmultipath: provide defaults for
 {get, put}_multipath_config
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 16:57 -0500, Benjamin Marzinski wrote:
> On Fri, Sep 25, 2020 at 10:00:10PM +0200, Martin Wilck wrote:
> > 
> > I suggest to track the verbosity independently in a different
> > variable,
> > and just set it from init_config() if it was actually set in the
> > config file. Most of the time, we set it from the command line.
> > This would have the additional benefit not to have to call
> > get_multipath_config() in dlog().
> 
> Sure. That sounds like a much simpler solution than what I was
> proposing.

I will do that in a separate patch. It will actually be a short
series with logging fixes. Would you ack this patch then?
In general it makes sense for get_multipath_config() to return NULL if
the struct config is not initialized.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

