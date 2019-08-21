Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28797733
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 12:32:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 361EC2CE955;
	Wed, 21 Aug 2019 10:32:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A0A18FC0;
	Wed, 21 Aug 2019 10:32:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63FAB2551C;
	Wed, 21 Aug 2019 10:31:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LAVgIw000630 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 06:31:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F64C5C221; Wed, 21 Aug 2019 10:31:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A36435C1D6;
	Wed, 21 Aug 2019 10:31:39 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 143B73082E44;
	Wed, 21 Aug 2019 10:31:36 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 21 Aug 2019 10:29:45 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 21 Aug 2019 10:28:07 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 21 Aug 2019 10:28:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gdph076ss3PsAL305v8c6lvPFQEiGTLynUfB664nznrOYFZaP3bwQy5Lek0I/ZadHg/soXq9wVbEDuSdD6tEXxbMltmYq/Di6gnX4z2BSKeW8vsQufH+RAcNwnBrpP3umzEDn51/2XLOlL5Ib5Kk4vOYZlm5K4iA++mCYp9MrvwMGnEeLifP4mw/py66Iaztd+3ZuI1ntKQKKHOjTkLLvXbAAsQ1+JOafej4NOAdIRdjA3LhOJJlaJdiHXh6v7uFiJV6UMPgdR1ETdCwlPGmGyhERcNshXkw4fmufkEorfVDxegxE8KM2ZkCXFnUipKoFAwusdY2uM17hSk5jvTSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sbAO4k3cTvZnU3NMlKJk6QCJhy5VTotyWIynB6Gw2mM=;
	b=V2VWsQmI41E0NZJljrDlcDVAM42I/RmGrbKJci+Nxn1XZQGup1Y75WnU9PTeU7EAe+iqxI8EixZw9nGvrrbHQFXrrxtiIx1mytUGQfOJnOrR7OoIzXcktZFo3bObWQF0nuIGlvtI26GGv5shgr4srauaiNCN6YLdlgC5WcRUPKfYp2BlHi5QexdowLVjeA0Eoi41cTlFthxTpH6YUGbrpmyHaWkNW4WuNs7QQb+sIKhN9RwrFgm5e3lM3fyDtOqVFeDdPscPJ1iKL4lv06EFfofVljeI/tdrLJLZgsNvNBEP/qliENsOK+ScEjcciaBgdsbP4gcUmcZbXsq2JGjMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3399.namprd18.prod.outlook.com (52.132.246.222) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Wed, 21 Aug 2019 10:28:06 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2178.018;
	Wed, 21 Aug 2019 10:28:06 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 10/16] libmultipath: make pgpolicyfn take a
	paths vector
Thread-Index: AQHVUuxsjC5YJKVTZEitk0mK3YTBsw==
Date: Wed, 21 Aug 2019 10:28:04 +0000
Message-ID: <08669317ce4779147e37e1c6cf4f40b5e79c6b76.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-11-git-send-email-bmarzins@redhat.com>
	<1f9360e75494c4597d80a08677a34441159b3af4.camel@suse.com>
	<20190816212837.GK25414@octiron.msp.redhat.com>
	<20190820225504.GN25414@octiron.msp.redhat.com>
In-Reply-To: <20190820225504.GN25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef8d9d73-52a3-4d60-12f3-08d72622416c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3399; 
x-ms-traffictypediagnostic: CH2PR18MB3399:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3399F97089449BAB8F24A0E8FCAA0@CH2PR18MB3399.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(199004)(189003)(51444003)(31014005)(7736002)(76176011)(450100002)(6512007)(53936002)(446003)(11346002)(6116002)(66066001)(107886003)(2616005)(6506007)(86362001)(2906002)(102836004)(25786009)(476003)(14444005)(2501003)(5640700003)(3846002)(256004)(71200400001)(71190400001)(229853002)(6486002)(6436002)(81166006)(66446008)(91956017)(81156014)(8676002)(1730700003)(6916009)(66946007)(8936002)(76116006)(316002)(486006)(478600001)(186003)(305945005)(14454004)(99286004)(4326008)(6246003)(2351001)(66556008)(36756003)(64756008)(5660300002)(54906003)(26005)(118296001)(66476007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3399;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9oKvnGaWMRmQbH3M6I3WTNt3fbRg8TyriFLOD+q8U7HNpVXA/yQpQ3R1b3eoPhBXdIklsvX0hxJaOtYg6Nu59Z4TyHfIpEWEiLCk5GLBsi4sXebMaotp4C641rZ7jt9vjxFkgxiudBe80eXuVFoBJs9rI3Mb67EPN3EPH8kkpQ/+MNv4tVC/ruMWt4NX8ntIcLqVJKqnY79Iew3yw/Mj09tQriFjyeZ3TwQeVck7nDbZ3O3u5qUf+nZvlltGlokyTb6jhYsW8re+64DeUwWDBRH/+K0DHp3bVkmSCgtpt5L8BrhDr5gyACx3XOIa2SVNLiFo+5VDjIbgcHy+4zeF7XsNJnc34leXkMhCpM+9zS/vbgwXcBIK85+IcCnkjfiLwocEBSfhDlS2V4Uh2awPWCrMeU5RoduivEOc2h2FVnA=
Content-ID: <6362BB2D880166439BC6D1B1B1531FDC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8d9d73-52a3-4d60-12f3-08d72622416c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 10:28:05.3436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pgfIJjA7Qo0ylx19L4m/9coRIo+VmOoOfo4dEImY4fT2o10bN3BdfVc4Z2IzhYhClevdSrkT1jVUCOCvoe+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3399
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 21 Aug 2019 10:31:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 21 Aug 2019 10:31:37 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7LAVgIw000630
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>, Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] [PATCH 10/16] libmultipath: make pgpolicyfn take a
 paths vector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 21 Aug 2019 10:32:06 +0000 (UTC)

On Tue, 2019-08-20 at 17:55 -0500, Benjamin Marzinski wrote:
> 
> So, I've looked at this, and I'd like to make the case that these
> patches don't put multipath into an inflexible method of dealing with
> path groups. In my mind, there are three issues with path grouping
> that
> my patches deal with
> 
> 1. How the paths are grouped together
> 2. How the pathgroups are ordered
> 3. How the best pathgroup is chosen
> 
> I'd argue that the only issue where my patches really adds some
> significant code is on 1. I think that my choice of groups for 1 is
> correct, and I have a suggestion for making issue 3 go away.
> 
> In regards to the first issue, how the paths are grouped together, my
> patch basically follows two rules:
> 
> 1. Marginal paths shouldn't be grouped with non-marginal paths.
> 
> Obviously, if you want the marginal paths to stay in the same group
> as
> they would normally be in, then you don't want marginal path
> detection
> at all.

Well, this is how multipathd used to behave - the "marginal" property
didn't have any influence on the path grouping. But this kind of
grouping can still be used by setting marginal_pathgroups to "no".
And if someone wants marginal path detection to be active and to affect
path grouping, indeed she doesn't want marginal and non-marginal paths
in one path group.

So yes, I think you are right here.


> >Further, I don't see a scenario where we would like the marginal
> paths to be grouped with non-marginal paths that they wouldn't
> normally
> be grouped with.

Right.

> 2. Marginal paths should be grouped with other marginal paths using
> the
> same rules as for non-marginal paths.
> 
> There are often very good reasons why paths are grouped the way they
> are.  For instance, if the marginal path is passive (I'm not even
> sure
> that we should keep paths in the marginal state if they are
> PATH_GHOST,
> but we currently do), we really don't want to put it in a pathgroup
> with
> active paths. There probably are cases where it is safe to put all,
> or
> some, of the marginal paths together, but it's not easy to know when
> that is, and I don't think there is much benefit from doing the work
> to
> figure it out, and it is always safe to group them like you would if
> they were non-marginal paths.
> 
> I don't see a better way to set up the groups than what my patch
> does,
> so I'm not particularly worried about all the code involved in making
> sure that the groups look like this.

Right. Note that your description of "marginal_pathgroups" in the man
page is a bit misleading, as it talks about "a separate pathgroup",
which could be read as "one separate pathgroup". The paragraph could be
understood such that all marginal paths are lumped together into one
PG, wich is not the case.

You have logically changed the path group vector into a 2-dimensional
Matrix. In the past, similar problems have been solved by simply
scaling the prio values (think ALUA with "exclusive_pref_bit" set), but
that obviously works for grouping only with "group_by_prio".
In fact, your new approach is more powerful, and we might consider
using it in a generalized form in the future.

> As for the second issue, how the pathgroups are ordered, I don't
> think
> my code locks us in at all.  The functions that order the pathgroups
> are
> path_group_prio_update() and sort_pathgroups().  If you wanted to
> make
> multipath just change the priority of marginal pathgroups, you would
> just need to set that priority in path_group_prio_update(), and if
> you
> only wanted to use the priority for sorting them, you would just
> change
> sort_pathgroups() to only sort by priority. If you wanted to change
> pgp->marginal from something binary to something that reflected how
> marginal a path was, and you want to have that to change how a path
> was
> sorted vs other paths with different marginal and priority values,
> you
> could do all of that by simply changing the values set in
> path_group_prio_update() and how those values are sorted in
> sort_pathgroups(). I don't think my code does anything to make this
> less
> flexible.

I guess you are right here, too. (*)

> As for the third issue, how the best pathgroup is chosen, this is
> also a
> case where changing things just involves changing how things are done
> in
> one function, select_path_group(), to match what's done in
> sort_pathgroups(). But since the pathgroups are already in order from
> the best one to use to the worst, the multipath userspace tools could
> just work how the kernel works, and pick the first usable pathgroup.
> This won't always give the same answer that multipath currently does,
> since the current code looks at the number of enabled paths. But the
> only times when it will be different is when there are multiple
> pathgroups with the same priority, and the first one has some failed
> paths.  Since we rarely have multiple pathgroups with the same
> priorty
> except when using the failover policy (group_by_serial and
> group_by_node_name being rarely used), and you will always have one
> path
> per pathgroup with failover, in practice this will almost never
> occur.

I don't see an inconsistency here. sort_pathgroups() also takes the
number of enabled paths into account; it's just not always called when
paths are failed or reinstated. The point is just that in the corner
case you describe, we run a lightweight "switch_group" ioctl rather
than reloading the map with a new PG ordering, which is good. (**) 

> Oh, I did notice a bug in my select_path_group() code. I should be
> calling path_group_prio_update() before checking if the pathgroup
> is marginal or not. I'll fix that.
> 
> So, I'm not against making this all work with priorities if there is
> a
> reason to do so, but doing that will just involve changes in 3
> straightforward functions, or 2 if we decide to simplify
> select_path_group() so it just uses the order from sort_pathgroups()
> as
> a guide.
> 
> If you feel strongly about doing this with priorities, I can add a
> patch
> that changes this. But if it gets us the same results, then I don't
> see
> much benefit. We can always change it laster if we want to change how
> the groups actually end up.

I had a discussion with Hannes, and it went rather the opposite way of
what I'd written in my previous post (consider multi-dimentional
priorities/grouping for the future). He strongly supported your notion
that "marginality" should be the most important grouping criterion /
priority factor, taking precedence over other factors.

So yes, you've mostly convinced me. Please re-post with the fixes you
mentioned, and I'll ack the series. I still have a number of open
issues with how we do prioritizing and grouping in general, but I agree
your series is a step in the right direction.

Cheers, Martin


(*) Note to self: It just occured to me that rather than using sorting,
we could use dm-multipaths's concept of "disabled" or "bypassed" path
groups to represent marginal groups. When switching PGs, the kernel
tries bypassed PGs only if all others have no valid paths, so this fits
your marginal model quite well. But then, we wouldn't have the
flexibility that PG sorting provides, as you argued. Moreover, PGs
can't start out bypassed when a map is reloaded, opening a short race
window where the kernel could try using these PGs. Finally, the kernel
sets the bypassed flag when a SCSI DH returns SCSI_DH_DEV_TEMP_BUSY,
which is used by the EMC and ALUA DHs, and at least by the latter in a 
questionable way (indicating unspecific errors). I find this whole
kernel logic weird - why disable the entire PG if a DH error occurs on
a single path? - but that's a different issue.

(**) In the corner-case-in-corner-case where all paths of this selected
PG (which is now not the first) fail, the kernel might come to a
different fallback conclusion as if we had re-sorted PGs. But I think
this can be ignored).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
