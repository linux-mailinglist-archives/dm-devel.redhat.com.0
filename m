Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20724821F
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 11:43:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-DjeXa-maMRKzK6-cLH3dPA-1; Tue, 18 Aug 2020 05:43:05 -0400
X-MC-Unique: DjeXa-maMRKzK6-cLH3dPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AD50801AE5;
	Tue, 18 Aug 2020 09:42:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6501BA63;
	Tue, 18 Aug 2020 09:42:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98671181A06B;
	Tue, 18 Aug 2020 09:42:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07I9gZ30004130 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 05:42:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C17420227BA; Tue, 18 Aug 2020 09:42:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B5D205EB13
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 09:42:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0494B800296
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 09:42:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-161-3L9--I2yOHGU1gzhqNvrwg-1;
	Tue, 18 Aug 2020 05:42:28 -0400
X-MC-Unique: 3L9--I2yOHGU1gzhqNvrwg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ECB97AE59;
	Tue, 18 Aug 2020 09:42:52 +0000 (UTC)
Message-ID: <99ad20088de1afe913f628a043a7374670894eff.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 18 Aug 2020 11:42:26 +0200
In-Reply-To: <20200818003055.GM19233@octiron.msp.redhat.com>
References: <20200812113601.26658-1-mwilck@suse.com>
	<20200812113601.26658-5-mwilck@suse.com>
	<20200818003055.GM19233@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 84/84] libmultipath: add consistency check
 for alias settings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-17 at 19:30 -0500, Benjamin Marzinski wrote:
> On Wed, Aug 12, 2020 at 01:36:01PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > A typo in a config file, assigning the same alias to multiple
> > WWIDs,
> > can cause massive confusion and even data corruption. Check and
> > if possible fix the bindings file in such cases.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/alias.c | 257
> > +++++++++++++++++++++++++++++++++++++++++++
> >  libmultipath/alias.h |   3 +
> >  multipath/main.c     |   3 +
> >  multipathd/main.c    |   3 +
> >  4 files changed, 266 insertions(+)
> > 
> > diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> > index 0759c4e..d328f77 100644
> > --- a/libmultipath/alias.c
> > +++ b/libmultipath/alias.c
> > 
> > +static int _check_bindings_file(const struct config *conf, FILE
> > *file,
> > +				 Bindings *bindings)
> > +{
> > +	int rc = 0;
> > +	unsigned int linenr = 0;
> > +	char *line = NULL;
> > +	size_t line_len = 0;
> > +	ssize_t n;
> > +
> > +	pthread_cleanup_push(free, line);
> > +	while ((n = getline(&line, &line_len, file)) >= 0) {
> > +		char *c, *alias, *wwid;
> > +		const char *mpe_wwid;
> > +
> > +		linenr++;
> > +		c = strpbrk(line, "#\n\r");
> > +		if (c)
> > +			*c = '\0';
> > +		alias = strtok(line, " \t");
> 
> I realize that your patch is just copying the existing code and I
> think
> our locking will save us here, but strtok isn't thread safe. We
> should
> consider changing all these to strtok_r().

I'll change this to strtok_r. I'll send a cumulative patch fixing the
other users as well.

I guess we'll also need to protect access to the bindings file. All
current accesses seem to be protected by the vecs lock (even
check_alias_settings(), called from reconfigure()), but we shouldn't
rely only on that. Also, multipath and multipathd could access the file
in parallel. Let's consider that later.

Btw, the vector holding the bindings in memory could obviously also
be used as a cache for looking up aliases at runtime. That would be
another item for later improvement. Actually, I thought we might
replace the vector here by some sort of hash map for even quicker
lookup. But I wanted to keep the already large patch series within
limits.

I'll send a v3 with your issues fixed.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

