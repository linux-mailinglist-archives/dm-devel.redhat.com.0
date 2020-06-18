Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B21ED1FEE3F
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 11:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592470886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bjWgWqRzk5Hqv0oFDWXERmnivPavTYwRbV9NIMXlEDY=;
	b=CC35sB7XK31lzFdkQIvxh9vyRsO+YKksc45C3rxqyKdw9FDgWJasGlwsJbCnC0qMNlu8Se
	2K2oNAbQghFVhq6o7NsS34QLp/z/BjORGsuYGTzCEt5hz2bqGNfibe/uuhwFf7elcGurcK
	2r51U0pd/bpvPf2U0wp0PaVKV2R5sX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-kZ5raniVNnOo36JN71MW8g-1; Thu, 18 Jun 2020 05:01:24 -0400
X-MC-Unique: kZ5raniVNnOo36JN71MW8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A10A0BE3;
	Thu, 18 Jun 2020 09:01:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 658F379322;
	Thu, 18 Jun 2020 09:01:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D0D51809547;
	Thu, 18 Jun 2020 09:01:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I910Jj029000 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 05:01:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8B102157F26; Thu, 18 Jun 2020 09:01:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C34AE2157F25
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:00:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73B2D101A526
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:00:56 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40051.outbound.protection.outlook.com [40.107.4.51]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-318-NADDtancNoO4VwE0ElMdLA-1; Thu, 18 Jun 2020 05:00:52 -0400
X-MC-Unique: NADDtancNoO4VwE0ElMdLA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Thu, 18 Jun 2020 09:00:50 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 09:00:50 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWRQbaV48I+cUSsEqBTrzd+h1sK6jeE96A
Date: Thu, 18 Jun 2020 09:00:49 +0000
Message-ID: <f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d9bf695-dd22-4a90-0cc8-08d81366191b
x-ms-traffictypediagnostic: DB8PR04MB7162:
x-microsoft-antispam-prvs: <DB8PR04MB7162C24AC68D62F3E1220FAEFC9B0@DB8PR04MB7162.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhPJP/IipilFf7hKn54MVBpyvXPzttWYiqXJRLv4e6G+g4b0g77gUt4+bjXr9INSu9NBnz2vi7UDeWVcOnZC3xDv9EIhSEqNP6aYhXh/PTfEgjnFdW5Y+pc9tH1Zfy1S9djOUbH9LEX2fNbcajW99IFNBNQEPKmDT0b+KRQlaX/p/Zrh4q6BJv8c2I/Ri1Owe/WWiJ/aMyYeEzNuAR/tqnKJJer0QVPMulFAR2XV3hpa/iFie/TQhtC4DE8yQrifUPyQrn/24+ucQrUdny6Vatu4LPY6ix56xANRtkz4eJFiYnZsOGDDutVVmNt9zLZJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(376002)(39860400002)(396003)(136003)(366004)(346002)(91956017)(76116006)(66556008)(66946007)(66476007)(64756008)(66446008)(26005)(186003)(316002)(54906003)(83380400001)(2616005)(86362001)(66574015)(6506007)(71200400001)(8936002)(2906002)(6486002)(110136005)(8676002)(36756003)(5660300002)(4326008)(6512007)(478600001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: fAE1QtLA2gY6Jwd46OVZb3T8Tj3b2ij+gTFg9cDIuDwSM9rABl6CUkh6rnZaltEz+8cZnirU+wVopRh2IdwlQ3QDqc6xR5ERmR0FbLiS8R2FSqwcbNxegiG85dZfajxoDSSICMrMj2ar4YBFBIjVNjp928OPx+D0ifUISl452YEajgDIbe2dqqlcyqIa7VaNqsnyQu8ssCRIPPMP01v4YC8RmyDWtHSR6yWDn/zXeJF/6mVSrRdA+MvfPXPgKZ9Y93DNrQudJizJ+GiAiYhb67iM9LXfBrahn7UcgfjnHwSEIkK5pMjtaEqS9Dcg6bKmEUsrGzCClC3qqxm+Bki6C2q6Bqbu3PL16qRI0ahD8VzLuYcv2wZkdbFGauhW9QYI/vbJd9kzCgEM5UtsXFe7Z+OTQn/5zbkd/AX1gNlnPX+U+znJZxTufP39jVGQl2FgwxRnx2W7fETjz2HAN1qaov2wKbb2RFk8VbV829nLsp4=
x-ms-exchange-transport-forked: True
Content-ID: <C7C576C008EC524A872ADFB7021492C8@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9bf695-dd22-4a90-0cc8-08d81366191b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 09:00:50.0610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ra4VXKXb30fOIRAbGGN6O8ynZD2DtSHyrm1GR0+mEBBIW5hknjiIlVwD12hMVm4a6VOMggTfF0MU/fEoEQ4uKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I910Jj029000
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
>=20
> One source of complexity in these patches is that multipath suspends
> the
> device with flushing before removing it, while multipathd
> doesn't.  It
> does seem possible that the suspend could hang for a while, so I can
> understand multipathd not using it.  However, that would take the
> multipath device getting opened and IO being issued, between the time
> when _dm_flush_map() verifies that the device isn't opened, and when
> it
> suspends the device.  But more importantly, I don't understand how
> suspending the device is useful. =20

I've looked up the origin of 9a4ff93 in SUSE bugzilla. The problem that
the patch tried to solve was that if map without healthy paths and with
queue_if_no_path set was removed, the removal might fail with=20
"map is in use".  Hannes' comment at the time was this:

 "Problem is that we're not waiting for all outstanding I/Os to
 complete. So the check for 'map in use' might trigger a false
 positive, as the outstanding I/O will keep the map busy. Once it's
 finished we can remove the map."

 "I'll add an explicit 'suspend/resume' cycle here, which will wait for
 all outstanding I/O to finish. That should resolve the situation."

Thus setting queue_if_no_paths =3D 0 and doing a suspend/resume was
basically a trick to force dm to flush outstanding IO.

> If the device were to be opened
> between when _dm_flush_map() checks the usage, and when it tries to
> delete the device, device-mapper would simply fail the remove.  And
> if
> the device isn't in use, there can't be any outstanding IO to flush.
> When this code was added in commit 9a4ff93, there was no check if the
> device was in use,

Hm, I see this in the code preceding 9a4ff93:

extern int
_dm_flush_map (const char * mapname, int need_sync)
{
[...]
        if (dm_get_opencount(mapname)) {
                condlog(2, "%s: map in use", mapname);
                return 1;
        }

... so it seems that there was a check, even back then.

>  and disabling queue_if_no_path could cause anything
> that had the device open to error out and close it. But now that
> multipath checks first if the device is open, I don't see the benefit
> to
> doing this anymore. Removing it would allow multipathd and multipath
> to
> use the same code to remove maps. Any thoughts?

With queue_if_no_paths, there could be outstanding IO even if the
opencount was 0. This IO must be flushed somehow before the map can be
removed. Apparently just setting queue_if_no_path =3D 0 was not enough,
that's why Hannes added the suspend/resume. Maybe today we have some
better way to force the flush? libdm has the _error_device() function=20
(aka dmsetup wipe_table) that replaces the map's table by the error
target. But this does a map reload, which implies a suspend, too.
Perhaps simply an fsync() on the dm device, or just wait a while until
all outstanding IO has errored out? But these alternatives don't
actually look better to me than Hannes' suspend/resume, they will take
at least as much time. Do you have a better idea?

multipathd=20

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

