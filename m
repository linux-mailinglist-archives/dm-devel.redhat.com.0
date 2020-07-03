Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA9B213800
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 11:48:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-SXlZTl7jMJSAgnhM_Y-35w-1; Fri, 03 Jul 2020 05:48:55 -0400
X-MC-Unique: SXlZTl7jMJSAgnhM_Y-35w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C822186A202;
	Fri,  3 Jul 2020 09:48:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE885FC1A;
	Fri,  3 Jul 2020 09:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAA426C9CB;
	Fri,  3 Jul 2020 09:48:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0639mOjc012970 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 05:48:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0539F218ADC1; Fri,  3 Jul 2020 09:48:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 890F7218ADC9
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 09:48:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9D31859171
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 09:48:22 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-129-9fqW9aPlNsepFW0KNx63Hg-1;
	Fri, 03 Jul 2020 05:48:20 -0400
X-MC-Unique: 9fqW9aPlNsepFW0KNx63Hg-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-2-ZfM2oBNYMj6UnEDCAxwDVQ-2; Fri, 03 Jul 2020 11:48:18 +0200
X-MC-Unique: ZfM2oBNYMj6UnEDCAxwDVQ-2
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2919.eurprd04.prod.outlook.com (2603:10a6:4:9b::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27;
	Fri, 3 Jul 2020 09:48:14 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3153.028;
	Fri, 3 Jul 2020 09:48:14 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v3 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWUM3skOgU0uXmUkm9Bkbpf56Bq6j1nCoA
Date: Fri, 3 Jul 2020 09:48:14 +0000
Message-ID: <95065bc425e4571e8cb49c5019196ffdba0357f0.camel@suse.com>
References: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7205c8e-a492-418b-2607-08d81f363486
x-ms-traffictypediagnostic: DB6PR0402MB2919:
x-microsoft-antispam-prvs: <DB6PR0402MB2919003F9067BA6C70DF429EFC6A0@DB6PR0402MB2919.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C7sQ/liQHWgfhb2qyKsYwpWV2M2PvsHSdhW6OQWWdI6W6KoFLZSZM9Np8KnLyoLpRoL/o04X12asqWBE+uHKYnmE3qJwhExEnrdjjeboONm3dQ7YSSglKpYfVQixkx4kQwffhLUMNYXVB370BuZCYT08ROUEt405gKEZhp0/xm9xmkMAzA2qN9IOrlZqOTyXswq7SAk3ZB54XiXQ2ELSy54H43xp2RdO0A9WZ/UaS82PkVo3rujKW1hC08FNl9h6JAOiiGam/qMR5SdRrGMQCteMwEOobhksZtMFL6jMSqKEC/RfisQVC87crqMJwuaz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(366004)(376002)(39860400002)(396003)(136003)(36756003)(66556008)(66946007)(83380400001)(66446008)(64756008)(8676002)(86362001)(5660300002)(2906002)(66574015)(8936002)(478600001)(6512007)(4326008)(71200400001)(66476007)(76116006)(91956017)(6506007)(186003)(26005)(110136005)(2616005)(316002)(6486002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: BgxBDaecOra0HCu7Sg+B8MMBI9c2BK9mWQl4ThiTDlwmIQ4aRATwifYPR/g5bojl5PNKyieLZH3f9hVp4No0NuTS6qk0HeKPUm7lFvLlm2XsdlgRPuZiyK8J6rwf6GTpG7A0Tfklq8NG1vt57mKWiP6GcvCS+YCW2qXKaCFUnIYEXIQeIH0UoWxRebzaLEjWYE9M/ySIaCLLGsXA8xm1Kju9Br/FxNuVueFDQRMzeXyr4kjjTUJ6HMYMmBzvdEU0HS4QIZ8bPvkBjq74kKhuk4X25rCXM1XQ45d2eLfc0iWh2+QNB6TKPmqAKNZippMiIeC14paJsZksOHE582x1Kufo8Q0Bz173orlFCpDmI9GnNl55GRdnmehIM9ytxk1wajDIHLORuXeN8EQ+U/yoFk/k2Y3RpW3liYWIcBCl7CwYVNdZVy4FUNlpg6uqP/qdwKedgIK74fPytqb2b/OSvHa90Y5UHt5lwYOscL/1ZAzejV0eEQnqExwyqOE7j9qF
x-ms-exchange-transport-forked: True
Content-ID: <29C9AFF244450F4F8E2BA45C7DB17027@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7205c8e-a492-418b-2607-08d81f363486
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:48:14.1637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cEkaqokDZlCDrTWwlQT5fDQVAsT1x+PD6wjRDBcEpBZ8NfytD2oI4odQkl2f4G89ly3aT2TUMu3fD08XNbZMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2919
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0639mOjc012970
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 0/7] Fix muitpath/multipathd flush issue
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-07-02 at 19:06 -0500, Benjamin Marzinski wrote:
> If a multipath device is removed, and check_path() checks one of its
> paths before multipathd processes either the uevent or the dm event
> from
> removing it, multipathd will recreate the removed device. This
> happens
> because check_path() will continute to check the removed device's
> former
> paths until an event arrives removing the device.  A missing multpath
> device will cause the update_multipath_strings() call to fail,
> setting
> pp->dmstate to PSTATE_UNDEF.  If the path is up, this dmstate will
> cause
> reinstate_path() to be called, which will also fail, because the
> multipath device doesn't exist.  This will trigger a reload,
> restoring
> the recently removed device.
>=20
> This patchset handles this is two ways. The first two patches
> directly
> fix these issues in check_path(), so that a missing multipath device
> will no longer get recreated when checking one of its former paths.
>=20
> The other 5 patches add a "multipathd del maps" command, and make the
> mutipath command delegate flush operations to multipathd so
> multipathd's
> state remains in sync with the kernel's, while doing removes.
>=20
> Changes from v1:
> 0001:=09This is completely different. I've change how patch 0002
> detects
> =09when a multipath device has disappeared. Instead of
> do_get_info,
> =09I need more return values on dm_get_map/status, and the
> =09update_multipath_* functions. I have used symbolic return
> =09values, which was the objection to the previous patch. I tried
> =09to picked generic enough names that they could be used for
> other
> =09devmapper.c functions as well.
>=20
> 0002:=09At Martin's suggestion, multipath now differentiates between dm
> =09failures and a missing multipath device in
> =09update_multipath_strings(). So there is no need to recheck if
> =09the device is missing.
>=20
> 0006:=09Added some man page info that was previously in patch 0007
>=20
> 0007:=09Removed mentions of the -D option in the man page and usage
> =09output.
>=20
> Changes from v2 (all are Martin's suggestions):
> 0001:=09Using dm_task_get_errno() and changed the names and values of
> =09the symbolic returns.
>=20
> 0002:=09Changed symbolic return names, and improved some logging.
>=20
> Benjamin Marzinski (7):
>   libmultipath: make dm_get_map/status return codes symbolic
>   multipathd: fix check_path errors with removed map
>   libmultipath: make dm_flush_maps only return 0 on success
>   multipathd: add "del maps" multipathd command
>   multipath: make flushing maps work like other commands
>   multipath: delegate flushing maps to multipathd
>   multipath: add option to skip multipathd delegation
>=20
>  libmultipath/config.h      |  4 ++-
>  libmultipath/configure.h   |  3 --
>  libmultipath/devmapper.c   | 63 +++++++++++++++++++++++++-----------
> --
>  libmultipath/devmapper.h   |  8 ++++-
>  libmultipath/structs_vec.c | 45 +++++++++++++++------------
>  multipath/main.c           | 44 ++++++++++++++++++--------
>  multipath/multipath.8      |  4 +--
>  multipathd/cli.c           |  1 +
>  multipathd/cli_handlers.c  | 19 ++++++++++++
>  multipathd/cli_handlers.h  |  1 +
>  multipathd/main.c          | 57 ++++++++++++++++------------------
>  multipathd/main.h          |  1 +
>  12 files changed, 160 insertions(+), 90 deletions(-)
>=20

For the set:

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

