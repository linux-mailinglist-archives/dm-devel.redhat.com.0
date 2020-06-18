Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 061441FFC45
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592510863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dS4UnG+/xdKaQv1VaTuhof4lOBW6LdWUidxCi8S8Dyw=;
	b=OIxrBrKwXZGXOGaJuyR08DoRsReB9usclxpkvhh9qGjXN5OFwXd2YiUpdv7JInd6m41FOH
	ozG35YBRXniL40kbeyIc1qsec89HhQCyFWd4gJdvSWbSTbsoYww70apZOQ4tt/RrI3oD07
	8QqPZDDV1bpFUv8zCE5pbVrrVvAbRjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-r4K7jRS9PxK70VQxlVbfoQ-1; Thu, 18 Jun 2020 16:07:40 -0400
X-MC-Unique: r4K7jRS9PxK70VQxlVbfoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 584D41940921;
	Thu, 18 Jun 2020 20:07:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C09E1E2272;
	Thu, 18 Jun 2020 20:07:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB9F91809547;
	Thu, 18 Jun 2020 20:07:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IK76Gb025145 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:07:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BC3610CD66F; Thu, 18 Jun 2020 20:07:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 455DC10EE79C
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:07:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C97385A5B1
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:07:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-271-fqCB1NexNHSshRgsO9hqRA-1; Thu, 18 Jun 2020 16:06:56 -0400
X-MC-Unique: fqCB1NexNHSshRgsO9hqRA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB7163.eurprd04.prod.outlook.com (2603:10a6:10:fe::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21;
	Thu, 18 Jun 2020 20:06:53 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:06:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWRQbaV48I+cUSsEqBTrzd+h1sK6jeE96AgACYCACAACIPAA==
Date: Thu, 18 Jun 2020 20:06:53 +0000
Message-ID: <c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
In-Reply-To: <20200618180458.GI5894@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 857da275-854e-4f49-1fd5-08d813c32515
x-ms-traffictypediagnostic: DB8PR04MB7163:
x-microsoft-antispam-prvs: <DB8PR04MB7163DFDFE4A8512ADF55751BFC9B0@DB8PR04MB7163.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nEZkQVt8Vzdoti2lv6KE3zJK220UcezdBCY9cz8klJwU4PZ88/gp8kl75UqFFv5kGtB7gDJMa/nnOWpyYg70/oUyK8I8kO5An9KWRC3olySd/OBF5n3BAz/TOlHy4QheXETfB4a2+6QlxyBsQxFbqBf1nI+toSyKBE4B999OAk/8S1SRWdCNHl/B1BhE5lPaHKknCvRdN/StF3SkQbmtS6oPKk2iaKA/VtUV9Xv0gANHzONxLVndqyA8mA+AZeZRd+qDHC3aUPJ+oHEKPfwPiYi3KGefrs4VIEob/shTISwXLoXpgz3wJrdl44ivoBVwjyz05o1DP+TCA09Ene9yNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(376002)(396003)(366004)(39860400002)(136003)(6506007)(76116006)(54906003)(86362001)(91956017)(316002)(83380400001)(66946007)(26005)(66556008)(186003)(66476007)(66446008)(66574015)(64756008)(71200400001)(36756003)(4326008)(2906002)(8676002)(6916009)(6486002)(5660300002)(508600001)(6512007)(8936002)(2616005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: KNv+xe6gdG8WbsbLNu1PyEIVsewqq0hEv9eLA+K53+TdbjPZUyw3p56n6w2hvT4LuDtvLBEM/s84PlYuf9hQdMHjzZuF7cu8FbVBUspeRdN1lyfluV1xMiiVH5v/YbDBv7ZRuiTI9Dz/dwWEtP8VemBBE9uzWqf0Zst9oKVdriG4B0w9g6Yn6ELwWam3N8qpMI/DxCB961t7EgEVpAKqPWdtfrr9sH7uXG02X3VdH9Ab5jD7dpJnkjJBW89sBEq9AFz2qcNSo3aOwLvU4ccRyU5+NTO1pkbJ1Cvtq5o7DbHhziRn+ImrlGa8yCAVM3Zw6OEN4cB/jvHKTxLbtGlWl5PttIUIif+H3sLPgdSQs8yeaYxwgOBSpmpbuiOX1LQtWaLWlaVvSzeAQ4URer37fpzSb/vwTxDV3ZBWAf4yfuHET2EgOGby8mMGoHnm7lF26Hj/LVHL9icoRkgOXT/IbhJqOFv+8eop83lLL7a/Gy0=
x-ms-exchange-transport-forked: True
Content-ID: <919495FFA682754C848652ED4B71DD44@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 857da275-854e-4f49-1fd5-08d813c32515
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:06:53.3477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeRXm5kk+/KiHXVaUMIGXlMuykKYSqb/yewDG0EqtTKuAoaU+vET8Ao1gWL2ZR90NWV3ayUWM1qRHLGDTyEdIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7163
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IK76Gb025145
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-18 at 13:04 -0500, Benjamin Marzinski wrote:
> On Thu, Jun 18, 2020 at 09:00:49AM +0000, Martin Wilck wrote:
> >=20
> > With queue_if_no_paths, there could be outstanding IO even if the
> > opencount was 0.
>=20
> This is what I don't accept at face value. I wrote a little test
> program that fired off an async read, closed the fd without waiting
> for
> a response, and then tried to exit.  running this on a queueing
> multipath device causes the exit to hang like this
>=20
>  cat /proc/22655/task/22655/stack
> [<0>] exit_aio+0xdc/0xf0
> [<0>] mmput+0x33/0x130
> [<0>] do_exit+0x27f/0xb30
> [<0>] do_group_exit+0x3a/0xa0
> [<0>] __x64_sys_exit_group+0x14/0x20
> [<0>] do_syscall_64+0x5b/0x160
> [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [<0>] 0xffffffffffffffff
>=20
> and the multipath device to remain in use
>=20
> # dmsetup info mpathb
> Name:              mpathb
> State:             ACTIVE
> Read Ahead:        256
> Tables present:    LIVE
> Open count:        0
> Event number:      7
> Major, minor:      253, 5
> Number of targets: 1
> UUID: mpath-3600d0230000000000e13954ed5f89301
>=20

The open count is 0. Wouldn't this be exactly the situation that
Hannes' patch was targeting - opencount 0, but still unable to
flush/close because of outstanding IO? If multipath was trying to flush
the map in this situation, it would disable queueing. Your process
would get an IO error sooner or later, and exit. But depending on the
amount of outstanding IO and the weather, this might not happen before
multipath had attempted to flush the map, and the flush attempt would
fail. By inserting the synchronous flush operation after disabling
queueing, multipath avoids that failure. Am I misunderstanding
something?


> I've asked around, and device-mapper is certainly supposed to flush
> all
> IO before the last close. Of course, there may be a corner case where
> it
> doesn't. If you know of one, that would be worth sharing.
>=20
> What I think that flush previously accomplished is that, just like
> the
> flush_on_last_del code, if you stop queueing and error out the IO,
> then
> whatever is waiting on it will get those errors, and likely close the
> device soon after, hopefully in time for multipath to remove the
> device.
>=20
> However, since multipath now checks if the device is in use before
> disabling queue_if_no_path, it don't think this code is actually
> helpful
> right now.
>=20
> > This IO must be flushed somehow before the map can be
> > removed. Apparently just setting queue_if_no_path =3D 0 was not
> > enough,
> > that's why Hannes added the suspend/resume. Maybe today we have
> > some
> > better way to force the flush? libdm has the _error_device()
> > function=20
> > (aka dmsetup wipe_table) that replaces the map's table by the error
> > target. But this does a map reload, which implies a suspend, too.
> > Perhaps simply an fsync() on the dm device, or just wait a while
> > until
> > all outstanding IO has errored out? But these alternatives don't
> > actually look better to me than Hannes' suspend/resume, they will
> > take
> > at least as much time. Do you have a better idea?
>=20
> To go back to the old behavior, we would need to move the check if
> the
> device is in use until after we suspended the device. Or we can keep
> the
> current behavior, and simply remove the flushing and suspending.
>=20

AFAICS the "in use" check looks at the opencount, and according to your
output above, it can be 0 while IO is outstanding. I haven't checked
this myself yet. But I can confirm that there was an actual bug (map
removal failing) that was allegedly fixed by the suspend/resume. It was
long ago, I can't tell with confidence if it could still happen.

Don't get me wrong, I'm not generally opposed to the removal of the
flush/suspend. I just wanted to clarify why it was there. It has been
used in multipath only, anyway. If we delegate to multipathd, it makes
sense to handle the situation in multipathd's manner. If we want to
make sure the user experience for "multipath -f" users is unchanged, we
could handle failure accordingly (suspend, resume, and retry flushing
the map).

Best,
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

