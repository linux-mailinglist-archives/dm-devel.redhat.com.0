Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B5F9B25E344
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 23:24:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465--8e3piu7MPaiy0yZ9Z9BwA-1; Fri, 04 Sep 2020 17:24:53 -0400
X-MC-Unique: -8e3piu7MPaiy0yZ9Z9BwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5CDA18A2261;
	Fri,  4 Sep 2020 21:24:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81BFF5D9CC;
	Fri,  4 Sep 2020 21:24:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4967818561B2;
	Fri,  4 Sep 2020 21:24:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LOHRZ023225 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:24:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E968E10FF25; Fri,  4 Sep 2020 21:24:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E52FEF6425
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 21:24:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1B65185A78B
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 21:24:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-136-waMQ99SjP92yIErmzblh-w-1;
	Fri, 04 Sep 2020 17:24:09 -0400
X-MC-Unique: waMQ99SjP92yIErmzblh-w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0B2C9AD19;
	Fri,  4 Sep 2020 21:24:09 +0000 (UTC)
Message-ID: <500db1f854e00efd844a7d2dab5d384ff74ec79d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 04 Sep 2020 23:24:06 +0200
In-Reply-To: <20200904182555.GA11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5edc1c2b-eb21-198b-9880-3be6621496f9@huawei.com>
	<4a51a6797398562b475e3320220112c2cd0d2186.camel@suse.com>
	<20200904182555.GA11108@octiron.msp.redhat.com>
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
Cc: lixiaokeng <lixiaokeng@huawei.com>, linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>, "liuzhiqiang
	\(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 05/14] multipathd: use MALLOC and check
 return value in, cli_getprkey func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-04 at 13:25 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 03, 2020 at 09:13:04PM +0200, Martin Wilck wrote:
> > On Wed, 2020-09-02 at 15:18 +0800, lixiaokeng wrote:
> > > In cli_getprkey func, we use MALLOC instead of malloc, and check
> > > the return value of MALLOC.
> > > 
> > > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > > Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> > > Signed-off-by: Linfeilong <linfeilong@huawei.com>
> > > ---
> > >  multipathd/cli_handlers.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/multipathd/cli_handlers.c
> > > b/multipathd/cli_handlers.c
> > > index 27e4574f..d345afd3 100644
> > > --- a/multipathd/cli_handlers.c
> > > +++ b/multipathd/cli_handlers.c
> > > @@ -1535,7 +1535,11 @@ cli_getprkey(void * v, char ** reply, int
> > > *
> > > len, void * data)
> > >  	if (!mpp)
> > >  		return 1;
> > > 
> > > -	*reply = malloc(26);
> > > +	*reply = MALLOC(26);
> > > +	if (!*reply) {
> > > +		condlog(0, "malloc *reply failed.");
> > > +		return 1;
> > > +	}
> > 
> > MALLOC is not necessary (*reply isn't left uninialized), nor is the
> > error message.
> 
> What's you objection to the error message? Admittedly there is
> basically
> no chance that malloc(26) would ever actually fail. But when things
> fail, having error messages so that we can debug them faster is
> helpful.
> 
> If your objection is that malloc checks are mostly just there for
> good
> form, and so those error messages won't actually help in practice, I
> agree. But as a general rule, I think we should print error messages
> on
> things that are unambiguoulsy errors.

See my reply to 00/14. I'd like to standardize and streamline "out of
memory" error messages, rather than hand-coding them in every
procedure. I think that in 99% of cases, if multipathd crashes or
errors out due to OOM, the information in which function OOM occured
first will not be helpful. Even if we had a major memory leak, its
unlikely that such error messages would help us find it.

Do you disagree?

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

