Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFA324110B
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 21:35:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-ogR6dJk5NoCipSZiaKH-ug-1; Mon, 10 Aug 2020 15:35:48 -0400
X-MC-Unique: ogR6dJk5NoCipSZiaKH-ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C162A1005504;
	Mon, 10 Aug 2020 19:35:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B0B819C71;
	Mon, 10 Aug 2020 19:35:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 683C4A5522;
	Mon, 10 Aug 2020 19:35:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AJZNrF008880 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 15:35:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0FFC20A8C49; Mon, 10 Aug 2020 19:35:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DACC920A8C47
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 19:35:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 894F18007DC
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 19:35:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-4RLoyK1VMuC2MY75X0-2PA-1;
	Mon, 10 Aug 2020 15:35:16 -0400
X-MC-Unique: 4RLoyK1VMuC2MY75X0-2PA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DD605AD68;
	Mon, 10 Aug 2020 19:35:34 +0000 (UTC)
Message-ID: <1c4254c39f6a0b6135a93fa634ece2930b9b7190.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 10 Aug 2020 21:35:13 +0200
In-Reply-To: <20200810190738.GN19233@octiron.msp.redhat.com>
References: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
	<7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
	<20200810190738.GN19233@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: yanxiaodan@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails
 in disassemble_map
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

On Mon, 2020-08-10 at 14:07 -0500, Benjamin Marzinski wrote:
> On Mon, Aug 10, 2020 at 02:20:27PM +0200, Martin Wilck wrote:
> > Hello Liu,
> > 
> > On Fri, 2020-07-24 at 09:40 +0800, Zhiqiang Liu wrote:
> > > In disassemble_map func, one pp will be allocated and stored in
> > > pgp->paths. However, if store_path fails, pp will not be freed,
> > > then memory leak problem occurs.
> > > 
> > > Here, we will call free_path to free pp when store_path fails.
> > > 
> > > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > > Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> > > ---
> > > V1->V2: update based on ups/submit-2007 branch.
> > > 
> > >  libmultipath/dmparser.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > 
> > thanks for the patch. I'd suggest to do this without the
> > pp_alloc_flag
> > variable, by pulling the store_path() call into the if (!pp)
> > conditional and treating failure differently in both branches of
> > the
> > conditional. (Side note: if we introduce a boolean like this, we
> > should
> > use "bool" as the variable type).
> > 
> > Unless you object, I'll add that change on top of my submit-2007
> > series, giving you appropriate credits.
> > 
> > @Ben, @Christophe: I've been considering for some time to start
> > handling cases like this with __attribute__((cleanup(f)))) (
> > https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html)
> > .
> > That could reduce the amount of goto clauses for error handling
> > significantly. It would be a major change in coding style though.
> > What
> > do you think?
> 
> So, I haven't really looked into the cleanup attribute. How would it
> work here? We only want to free the path if we didn't store it. We
> can't
> free it if it got stored.  Can you disable the cleanup? If we have to
> make the cleanup function check if the path got stored, that seems
> like
> more work than simply using the multiple goto labels like we do now.

I need to think it through in more detail for this particular use case.

The general pattern makes use of the steal_ptr() macro, and the fact
that free(NULL) is a noop:

#define steal_ptr(x) ({ void *__p = x; x = NULL; __p; })

struct xyz;
void cleanup_xyz(struct xyz **p)
{
       free(*p);
}

struct xyz *func()
{
        struct xyz *xy __attribute__((cleanup(cleanup_xyz))) = NULL;

        xy = alloc_xyz();
        if (!xy)
                return;
        if (do_something_with(xy) == SUCCESS)
                /* avoid freeing xy by setting it to NULL */
                return steal_ptr(xy);
        else
                /* xy remains non-NULL and will be freed on return */
                return NULL;
}

More often than not, with this technique, gotos can be avoided
completely, and the readability is IMO improved. systemd uses this
pattern a lot.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

