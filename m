Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2926219D36D
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 11:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585905765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mC5jub/BvFy5e+OyOzbPb4Mgkw2zfZzZ2gqG+P5yfyE=;
	b=QnD8vbt52L0UPt8PqxoFVQ5Y1R5FdszMPST18LPKBcdTjsZJVfkBA1C6SoDE8Jn/jpQalK
	ERN46fGJDzFnkfLQpPh80UpYLfAynvCYrsP8WrMJB6hR66q/wmgpAlHmnarRx3mhZtzcPL
	/52sCVCejJlNj/idVl0U5MRvBQKhans=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-_N95WbKaMKqhbamBmUombw-1; Fri, 03 Apr 2020 05:22:43 -0400
X-MC-Unique: _N95WbKaMKqhbamBmUombw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762CD13F6;
	Fri,  3 Apr 2020 09:22:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BB35C1B0;
	Fri,  3 Apr 2020 09:22:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9865B4E440;
	Fri,  3 Apr 2020 09:22:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0339KGh5006071 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 05:20:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDF6E101B55A; Fri,  3 Apr 2020 09:20:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7756101B55E
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 09:20:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B991101A55D
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 09:20:12 +0000 (UTC)
Received: from m4a0073g.houston.softwaregrp.com
	(m4a0073g.houston.softwaregrp.com [15.124.2.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-276-eNpwuKweML2z9Z2BP01lxA-1;
	Fri, 03 Apr 2020 05:20:08 -0400
X-MC-Unique: eNpwuKweML2z9Z2BP01lxA-1
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0073g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  3 Apr 2020 09:17:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 3 Apr 2020 09:15:00 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 3 Apr 2020 09:15:00 +0000
Received: from MWHPR18MB1357.namprd18.prod.outlook.com (2603:10b6:300:ce::16)
	by MWHPR18MB1661.namprd18.prod.outlook.com (2603:10b6:300:ce::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16;
	Fri, 3 Apr 2020 09:14:58 +0000
Received: from MWHPR18MB1357.namprd18.prod.outlook.com
	([fe80::b470:47ea:73e5:932]) by MWHPR18MB1357.namprd18.prod.outlook.com
	([fe80::b470:47ea:73e5:932%10]) with mapi id 15.20.2878.017;
	Fri, 3 Apr 2020 09:14:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [RFC Patch 3/3] multipath: add libmpathvalid library
Thread-Index: AQHWBwBENL3rjIinMkyJOcEYO+YD1qhi1tKAgAAfeoCABCxiAA==
Date: Fri, 3 Apr 2020 09:14:58 +0000
Message-ID: <5d2bfd10f5325e87cddd31477f2f6c51b1dfee9c.camel@suse.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-4-git-send-email-bmarzins@redhat.com>
	<1e138c8f609a34f7fc6cc244f7516797c5e97a2b.camel@suse.com>
	<20200331173103.GI17313@octiron.msp.redhat.com>
In-Reply-To: <20200331173103.GI17313@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d04a1d6c-7392-477c-3141-08d7d7af7b58
x-ms-traffictypediagnostic: MWHPR18MB1661:
x-microsoft-antispam-prvs: <MWHPR18MB1661C054CFA5DD108379494DFCC70@MWHPR18MB1661.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR18MB1357.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(2616005)(66446008)(66556008)(66476007)(91956017)(66946007)(64756008)(76116006)(6486002)(66574012)(186003)(26005)(6512007)(478600001)(81156014)(8936002)(81166006)(36756003)(6916009)(86362001)(5660300002)(71200400001)(8676002)(2906002)(6506007)(4326008)(316002)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7nYPthgppKJld8uTT7vN4LNkPn4cjMqb/zH25rhMsoALtn634aETf8r/IhHxmzdb3HXzbVdmCDJLzc73jf230xA8qogpd+jN8ls9c1xnm3qyQKJGeNNgmkaqdRHk4aw7Z3hFgZE0aPl9D9wqB4JchqtfQbNue4aSPJkgYR18B+eYuXdJjp8yn6979L/HIyUGu3BOg2K6hiMd/8HJ5xuh87RLtnMeFSnx29owEV7zdhmbUoL6U5tckBKqW3xPR0uyUFnqntf0X5aGc1kSFd8TvThYqR+DV6hpNLtIUxA7Rc+ScCu05q0yFWIUFbZjMYN3SQhO07cOSO/hC3tKsdyX532+vxGl1LTkxGQ+XRwEzdWhwmSLehtyf2+cqQxQFjWqm5kaZVd+Rw/4JE5qfmn7gEjK5pZHuE5MujmtPgY6/SvEw+1K8IjRoC3XwkH6HO/
x-ms-exchange-antispam-messagedata: uouk6Jx1K7j4ax0rPfzysT9UH9KwtCvNXmh/GadD1+RrYXF/i2G5Tv/kh14x0E73/r1KUqHXd350AzTb6zTT7lJxSuqbT0pyxXM7OUeF9xmXkG39/r1B3vErs4pm5lidip2bHhEkGRmwOWGWOvCfXw==
x-ms-exchange-transport-forked: True
Content-ID: <BA363B81BE725E4D98DED471F3A1CA43@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d04a1d6c-7392-477c-3141-08d7d7af7b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 09:14:58.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avtOYgxpRcMHoLFQppBpDprpugOQbWsxjn26qV2z4KPxEZzM1Wgmy3OCbLgRHoj33o8Nb9az41OUDmzSmfX26g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1661
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0339KGh5006071
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC Patch 3/3] multipath: add libmpathvalid library
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Tue, 2020-03-31 at 12:31 -0500, Benjamin Marzinski wrote:
> On Tue, Mar 31, 2020 at 03:38:25PM +0000, Martin Wilck wrote:
> > On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> > > This library allows other programs to check if a path should be
> > > claimed
> > > by multipath.  Currently, it only includes one function,
> > > mpath_is_path(), which takes a device name, mode to for checking
> > > the
> > > path, and an optional info structure, to return the wwid. The
> > > modes
> > > work
> > > mostly like they do for "multipath -c/-u", with a few exceptions.
> > >=20
> > > 1. If a device is currently multipathed, it is always VALID. This
> > > perhaps should be true for the existing path valid code.
> >=20
> > AFAICS, this is already the case, except if:
> >=20
> >  1 WWID_IS_FAILED is set, i.e. dm_addmap() failed to set up
> >    the multipath with this WWID last time we tried. In this case
> > it's
> >    unlikely that the path is currently multipathed. But there may
> > be
> >    some corner case in which your new code would return "valid"
> >    while the current code would not; possibly if someone set up a
> >    multipath device with "dmsetup" directly, or because of some
> > race
> >    condition. I just realized that we don't check for -EBUSY when
> > we
> >    create a map...
> >=20
> >    I agree that perhaps the "is_multipath" test should be done
> > before
> >    the "failed" test in multipath -u, too.
> >=20
> >  2 ignore_wwids is off, and check_wwids_file returned a negative
> >    result. IMO this logic is correct. But you are the inventor of
> >    the wwids file, so fine with me to change it.
> >  =20
> > And also if multipathd is neither running nor enabled, but see
> > below.
>=20
> See below for my thoughts on its placement
>=20
> > > 2. There is no seperate "on" mode. It is instead treated like
> > > "smart".
> > > This is because the library only looks at a single path, so it
> > > can
> > > only
> > > say that a device could be multpathed, if there was another
> > > path.  It
> > > is
> > > the caller's job to check if another path exists, or to wait for
> > > another
> > > path appear.
> >=20
> > I'm not sure if I like this. Returning "no" for the first path and
> > "yes" for the second and later paths is exactly how
> > "find_multipaths=3Dyes" is supposed to behave. If that's not useful
> > for
> > an application, the application should choose a different mode; and
> > that's what I believe SID should do (assuming that SID will be the
> > main
> > / only user of this API for some time).
>=20
> SID just wants to be able to look at one path at a time.  It will be
> storing the information from previous path runs, so it will be able
> to
> check if there are other paths with that wwid.=20

That's not an argument against returning "false" for the first path
(find_multipaths=3Don). If that's not appropriate for SID, and it depends
on "smart" behavior instead, it could just pass mode=3DMPATH_SMART to
mpath_is_path(), could it not?=20

> > I really don't want to
> run coalesce_paths in the library,=20

Sorry, I wrote nonsense. Of course "multipath -u" does not call
coalesce_paths(). It just calls path_discovery() and filter_pathvec(),
which has basically the same effect as building up a vector of WWIDs.

multipath -u currently does one more thing, the open(O_RDONLY|O_EXCL)
test. I recall we had some controversy about that initially, but it
doesn't seem to have hurt.

> to search repeatedly for all the
> paths. It's completely unnecessary, since the information will have
> already been gotten by previous calls to the library.

But IIUC this means that for the 2nd path of a given WWID,
mpath_is_path() will still return false, because the first path will
not be multipathed (yet) when the second one appears and is checked by
udev rules. This would happen both if multipathd was not running, and
if multipathd was in "find_multipaths=3Don" or "smart" mode. Even for
path 3 and beyond, the functionality depends on multipathd running and
doing the right thing.

So I gather that SID will rely only partially on this function. By
comparing the path WWID with WWIDs in its stores, it could conclude
that a given device was a multipath path, even if mpath_is_path()
returned false. Correct?=20

This bears the risk that the logic of multipathd and SID could
diverge. It took us a lot of effort to fix the issues arising from=20
different interpretation of path status between multipathd and
multipath -u, and I'd recommend not to resuscitate that beast.

For example, if mpath_is_path() returns false, but SID finds more than
one path with the given WWID, how would SID know whether was just a
case of "second path always false", or the WWID was blacklisted or
failed? Perhaps mpath_is_path() should provide different return codes
for different reject reasons?

Thinking about it, the safest bet might be to invent a multipathd cli
command for this functionality, and ask multipathd about it's own
judgement about the device's status. We don't do that in udev rules in
order not to depend on multipathd too much, but for SID it might be an
option, if it depends on multipathd anyway.

> To deal with SID, I could have the function take an array of
> path_info
> structures holding all the known wwids. This would allow the function
> to
> return "No" for the first path in the "find_multipaths=3Dyes" case.
> However, this would make the library worse for use by "multipath -u",
> since multipath would have to gather the existing path wwids before
> it
> knew if it needed them.

The function could gather this information itself in case it needs it.
Which is what "multipath -u" does, by calling path_discovery() and
filter_pathvec(). You could pass an optional pathvec argument, and have
mpath_is_path() call path_discovery() only if that pathvec was NULL /
empty.

> Assuming we are moving the main part of this into libmultipath, I
> could
> make that run in two modes. One would be like it currently works and
> not
> require the array of wwids, which would be for the "multipath -u"
> code.
> The other would require the array, and that would be what
> libmpathvalid
> used. Perhaps something as simply as passing -1 for the array length
> could mean make no assumptions about other paths, and return "maybe",
> if
> this path needs a second path in order to be claimed. Then the
> "multipath -u" could run coalesce_paths() later, if necessary.
>=20

See above.


> > > 3. The library does check if there already is an existing
> > > multipath
> > > device with the same wwid, and if so, will declare the path
> > > valid.
> >=20
> > What if there are other paths, not multipathed (yet) but with the
> > same
> > wwid as the path in question? The current code checks that by
> > calling
> > coalesce_paths() in "dry-run" mode, which would cover both this
> > case
> > and your case 3.
> >=20
> >=20
> > > In order to act more library-like, libmpathvalid doesn't set its
> > > own
> > > device-mapper log functions. It leaves this to the caller. It
> > > currently
> > > keeps condlog() from printing anything, but should eventually
> > > include
> > > a
> > > function to allow the caller set the logging. It also uses a
> > > statically
> > > compiled version of libmultipath, both to keep that library from
> > > polluting the namespace of the caller, and to avoid the caller
> > > needing
> > > to set up the variables and functions (like logsink, and
> > > get_multipath_config) that it expects.
> >=20
> > All fair, but I'd prefer a solution where we use as much common
> > code
> > as possible, to avoid bit rot of either code path in the future.
> > Your
> > new function has the advantage to be much better readable than the
> > current code in multipath/main.c. Maybe we can find a way to use it
> > from "multipath -u"? The mentioned semantic changes are minor and
> > could
> > be resolved (not sure about the coalesce_paths() call, I guess you
> > had
> > a reason to skip it).
> >=20
> > The namespace issue could be fixed by using=20
> > "-fvisibility=3Dhidden" and using explicit visibility attributes for
> > those functions we want to export. The logsink and
> > get_multipath_config
> > issues should be solvable by using a sane default implementation
> > and
> > allowing applications to change it.
> >=20
> > Both would be improvements for libmultipath that we should have
> > made
> > long ago.
>=20
> Having libmultipath store logsink and get_multipath_config, and
> making
> getter and setter functions would be great. But I'm worried that
> making
> that change might mess with current users of libmpathpersist.
>=20
> There are still a number of functions that multipath, multipathd, and
> libmpathpersist need from libmultipath, that libmpathvalid doesn't,
> but
> -fvisibility=3Dhidden would fix a large part of my dislike with the
> namesapce polution. I'm still not crazy about telling people to link
> against a library with a number of exposed, undocumented functions,
> but
> we already been doing it for a while with libmpathpersist.

Hm, yes I think libmpathpersist uses quite a bit of libmultipath.
And well, multipath and libmultipath use essentially every symbol.
So right, a simplistic -fvisibility=3Dhidden won't work.

Regards
Martin


--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

