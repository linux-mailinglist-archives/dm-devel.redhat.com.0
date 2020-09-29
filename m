Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3292A27C132
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 11:31:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-_c1tcqKPNxyjyziWzxRzAA-1; Tue, 29 Sep 2020 05:31:35 -0400
X-MC-Unique: _c1tcqKPNxyjyziWzxRzAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D3B186DD20;
	Tue, 29 Sep 2020 09:31:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2F8B5C1C4;
	Tue, 29 Sep 2020 09:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8252181A050;
	Tue, 29 Sep 2020 09:31:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T9VF1S014919 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 05:31:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88C2DAB59C; Tue, 29 Sep 2020 09:31:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 844B8AB5A1
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:31:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A012811E78
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:31:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-520-pByUvCeLP6i0mmiXjA-m-g-1;
	Tue, 29 Sep 2020 05:31:08 -0400
X-MC-Unique: pByUvCeLP6i0mmiXjA-m-g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7417BAC6E;
	Tue, 29 Sep 2020 09:31:07 +0000 (UTC)
Message-ID: <3ebea94ffd3be1a24c1f3a3159a337a7e878ce99.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 29 Sep 2020 11:31:06 +0200
In-Reply-To: <20200928202624.GP3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-20-mwilck@suse.com>
	<20200928202624.GP3384@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 19/23] multipathd: move cleanup_{prio,
 checkers, foreign} to libmultipath_exit
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 15:26 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 03:40:50PM +0200, mwilck@suse.com wrote:
> > 
> >  /*
> >   * We don't support re-initialization after
> > @@ -65,6 +66,9 @@ int libmultipath_init(void)
> >  static void _libmultipath_exit(void)
> >  {
> >  	libmultipath_exit_called = true;
> > +	cleanup_foreign();
> 
> I don't really feel too strongly about this, but it seems to me that
> there is a difference between the checkers and prioritizers, which
> it seems like most users of libmultipath would want, and the foreign
> code, which doesn't seem that way. libmpathpersist, for instance,
> will use the checkers and prioritizers, but not the foreign code.
> On the other hand, if the caller isn't using the foreign code,
> then grabbing the lock and checking the foreign pointer shouldn't
> take much time.

It would just be a few cycles. I want callers to have to worry about
cleanup as little as possible. All else is error-prone IMO, and
although I agree that the foreign functions are less important than
checkers and prio, I thought it made sense to treat all our "plug-ins"
the same way.

Ideally I'd like to do checker/prio/foreign initialization completely
lazily too, in the sense that callers don't need to worry about calling
init_checkers() etc., either. But this series had to stop at some
point.

Either way, it's not a big issue, so please tell me if you feel
strongly enough about it to ask me to revert the change.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

