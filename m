Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E98A023D2E9
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 22:22:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-HiBbbDQ2OoakYUywdeETKg-1; Wed, 05 Aug 2020 16:22:29 -0400
X-MC-Unique: HiBbbDQ2OoakYUywdeETKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC531902EA1;
	Wed,  5 Aug 2020 20:22:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5932B69314;
	Wed,  5 Aug 2020 20:22:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58DA296924;
	Wed,  5 Aug 2020 20:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075KM9iC011721 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 16:22:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3500202A942; Wed,  5 Aug 2020 20:22:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4E7202A97C
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:22:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3664D89CD15
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:22:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-101-p7uyfKKkNAmS1mZnd67IcA-1;
	Wed, 05 Aug 2020 16:22:04 -0400
X-MC-Unique: p7uyfKKkNAmS1mZnd67IcA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6D83AAEA2;
	Wed,  5 Aug 2020 20:22:20 +0000 (UTC)
Message-ID: <ed5732db92891321d5a19a86b598c1b1975856d5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 22:22:02 +0200
In-Reply-To: <20200720025752.GZ11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-19-mwilck@suse.com>
	<20200720025752.GZ11089@octiron.msp.redhat.com>
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
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 71/74] multipath: use update_pathvec_from_dm()
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

On Sun, 2020-07-19 at 21:57 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:51:42PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > The multipath-specific function update_paths() can now be replaced
> > with
> > a call to update_pathvec_from_dm().
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  multipath/main.c | 67 +++-----------------------------------------
> > ----
> >  1 file changed, 3 insertions(+), 64 deletions(-)
> > 
> > diff --git a/multipath/main.c b/multipath/main.c
> > index 8a2a6f7..435c5d5 100644
> > --- a/multipath/main.c
> > +++ b/multipath/main.c
> > 
> >  static int
> >  get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec,
> > char * refwwid)
> >  {
> > @@ -273,13 +216,8 @@ get_dm_mpvec (enum mpath_cmds cmd, vector
> > curmp, vector pathvec, char * refwwid)
> >  		condlog(3, "status = %s", status);
> >  
> >  		disassemble_map(pathvec, params, mpp);
> > -
> > -		/*
> > -		 * disassemble_map() can add new paths to pathvec.
> > -		 * If not in "fast list mode", we need to fetch
> > information
> > -		 * about them
> > -		 */
> > -		update_paths(mpp, (cmd == CMD_LIST_SHORT));
> > +		update_pathvec_from_dm(pathvec, mpp,
> > +				       (cmd == CMD_LIST_SHORT ? 0 :
> > DI_ALL));
> 
> I personally don't think that "multipath -l" should be opening the
> path
> fd. Checking sysfs seems like the limit of what we want to do for
> fast
> listing. So, I would prefer
> 
> update_pathvec_from_dm(pathvec, mpp,
> 		       (cmd == CMD_LIST_SHORT ? DI_NOIO : DI_ALL));
> 
> That will make pathinfo exit early.

Good suggestion. But then I need to avoid rerunning pathinfo() for
already scanned paths in update_pathvec_from_dm(). Will do.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

