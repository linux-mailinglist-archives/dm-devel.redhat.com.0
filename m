Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA05DFD0
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 11:52:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B65763091784;
	Mon, 29 Apr 2019 09:52:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551255DF2F;
	Mon, 29 Apr 2019 09:52:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 335BA41F3D;
	Mon, 29 Apr 2019 09:52:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3T9qJjx021311 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 05:52:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0873017792; Mon, 29 Apr 2019 09:52:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2DC17789;
	Mon, 29 Apr 2019 09:52:12 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87D44C4EAC;
	Mon, 29 Apr 2019 09:52:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0E349AD43;
	Mon, 29 Apr 2019 09:52:10 +0000 (UTC)
Message-ID: <f839ea76c050d643c617bb7f5de3ef76f104123f.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Mike Snitzer <snitzer@redhat.com>, yuyufen <yuyufen@huawei.com>
Date: Mon, 29 Apr 2019 11:52:08 +0200
In-Reply-To: <20190425194534.GA20137@redhat.com>
References: <20190424151905.22615-1-yuyufen@huawei.com>
	<ed4a3f0c76cdeef15f549a475a6b31eca177c392.camel@suse.de>
	<d49d1784-6ecf-5450-a633-692ba107b9ee@huawei.com>
	<20190425194534.GA20137@redhat.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 29 Apr 2019 09:52:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 29 Apr 2019 09:52:11 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, yi.zhang@huawei.com, mpatocka@redhat.com,
	ming.lei@redhat.com, houtao1@huawei.com
Subject: Re: [dm-devel] [PATCH v2] dm mpath: fix missing call of path
 selector type->end_io
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 29 Apr 2019 09:52:26 +0000 (UTC)

On Thu, 2019-04-25 at 15:45 -0400, Mike Snitzer wrote:
> On Thu, Apr 25 2019 at  5:25am -0400,
> yuyufen <yuyufen@huawei.com> wrote:
> 
> > > "CANCAL" looks strange - did you mean "CANCEL"?
> > 
> > This is a spelling error.
> > 
> > > Anyway, what do you need this new enum for? Couldn't you just
> > > pass the
> > > disposition (i.e. DM_MAPIO_REQUEUE), and use a different value
> > > (e.g.
> > > DM_ENDIO_DONE) at those call sites where end_io shouldn't be
> > > called?
> > > 
> > > Regards,
> > > Martin
> > > 
> > > 
> > > .
> > > 
> > 
> > Thanks for your suggestion. Passing DM_MAPIO_REQUEUE is a good
> > idea.
> > It indicates that request will be requeued and we need to call
> > ->end_io.
> > 
> > However, I am not sure if it is suitable for use DM_ENDIO_DONE.
> > It is strange that we use DM_ENDIO_DONE in
> > dm_requeue_original_request(),
> > which is called in the case of DM_ENDIO_REQUEUE in dm_done().
> 
> I've staged the following, it doesn't get bogged down with passing
> flags
> (and overloading their use with unnatural new meanings).  Please let
> me
> know if you see any issues:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.2&id=5de719e3d01b4abe0de0d7b857148a880ff2a90b

Nice and simple. Looks good to me.

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
