Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C431279192
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 22:00:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Bw6FfYkPMWe71cdM3xN-LQ-1; Fri, 25 Sep 2020 16:00:35 -0400
X-MC-Unique: Bw6FfYkPMWe71cdM3xN-LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36771188C129;
	Fri, 25 Sep 2020 20:00:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B12CB19C59;
	Fri, 25 Sep 2020 20:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D01B44A79;
	Fri, 25 Sep 2020 20:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PK0Ihx020300 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 16:00:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B22A2100C2A3; Fri, 25 Sep 2020 20:00:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4971084497
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 20:00:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F4B101AA41
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 20:00:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-499-nnCkglqsOZapcPNIa0d8pw-1;
	Fri, 25 Sep 2020 16:00:13 -0400
X-MC-Unique: nnCkglqsOZapcPNIa0d8pw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B15DDAD08;
	Fri, 25 Sep 2020 20:00:11 +0000 (UTC)
Message-ID: <e0637cd84ca36dbba00f8ff5b92ffcb8e81aa747.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 25 Sep 2020 22:00:10 +0200
In-Reply-To: <20200925043458.GO11108@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-14-mwilck@suse.com>
	<20200925043458.GO11108@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-24 at 23:34 -0500, Benjamin Marzinski wrote:
> 
> This causes problems with the libmpathvalid library code I
> wrote.  The
> issue is that right now, when you run _init_config() if
> get_multipath_config() returns NULL, you will use the default
> loglevel.
> I would like the library user to have control of the log level, even
> during the calls to _init_config().

I see. So using init_config() actually had a benefit for you already
over load_config() :-) Such control over the verbosity would actually
be good for multipath-tools, too.

> One possiblity would be to make init_config() take verbosity as an
> argument.  There would also need to be some other config variable
> that
> gets set at the start of init_config(), which is used by
> libmp_get_multipath_config() to check if it is initialized.

I suggest to track the verbosity independently in a different variable,
and just set it from init_config() if it was actually set in the
config file. Most of the time, we set it from the command line.
This would have the additional benefit not to have to call
get_multipath_config() in dlog().

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

