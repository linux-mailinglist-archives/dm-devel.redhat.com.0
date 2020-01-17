Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 16C18140EAB
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 17:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579277264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9T5dX19aqE9vAb+dtHZuL6P9IXq82xgO76Fiea3ZHsc=;
	b=ZICr9EjuoJRBqNwBZAcDPQOWKpjGPxFTuTp8gm5uv6h6+1x+gM6sdNQlzX0JwcoAZ0KewB
	nCwEl1GW8+3gj4kK7wJKb2ggQsZyBv2KXm/1IVaGNlFoTw94SFZ0QkcwWN0LHjNBOtNZeX
	DpjILTeJcHZVbJtko/1sqrXomwcNQNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-diAuuo79O_e0Wb8ZTDf6Jg-1; Fri, 17 Jan 2020 11:07:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA96DA0CBF;
	Fri, 17 Jan 2020 16:07:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F36F7577F;
	Fri, 17 Jan 2020 16:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6225A18089CD;
	Fri, 17 Jan 2020 16:07:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HG7RiM019087 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 11:07:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BBACB2166B2A; Fri, 17 Jan 2020 16:07:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6AE22166B29
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:07:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92DF0802E74
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:07:25 +0000 (UTC)
Received: from m4a0073g.houston.softwaregrp.com
	(m4a0073g.houston.softwaregrp.com [15.124.2.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-334-wUxWXIwpOPC9B1a2R9FSqQ-1;
	Fri, 17 Jan 2020 11:07:22 -0500
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0073g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 17 Jan 2020 16:05:21 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 17 Jan 2020 15:45:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 17 Jan 2020 15:45:36 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1433.namprd18.prod.outlook.com (10.173.210.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Fri, 17 Jan 2020 15:45:35 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2644.015;
	Fri, 17 Jan 2020 15:45:35 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 01/15] multipathd: warn when configuration has been
	changed.
Thread-Index: AQHVzU0o7+DBxG6LoEaghZQOuHT5+w==
Date: Fri, 17 Jan 2020 15:45:34 +0000
Message-ID: <586e8c02fc60cde6771c14f7aa012c3fd55cc3ca.camel@suse.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.203.211.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cc72aa8-a7f6-4ff9-110e-08d79b644adf
x-ms-traffictypediagnostic: DM5PR18MB1433:
x-microsoft-antispam-prvs: <DM5PR18MB1433CEFD04F41E318223478CFC310@DM5PR18MB1433.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(6512007)(6486002)(2616005)(316002)(6506007)(4326008)(110136005)(66574012)(86362001)(71200400001)(81166006)(2906002)(8676002)(66556008)(8936002)(81156014)(36756003)(26005)(76116006)(64756008)(478600001)(91956017)(186003)(66476007)(5660300002)(66946007)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1433;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8pWG6VIBEAGuDX4f334Vm1OLYqPuj/iteEh6mZPDtkBB6n6JIoDLrnUv36eZWLFhKflUEn0wKNXUN2dhlyWpHgvExzo5sjZbB2T1ub4Y09obA7hTJp52nTMbhg8CZGvDItN/zFjDh9GMCZ8CVk48JLEyYdBZOhrBw9yE6oQp9mSaUxScQD5NeF9DlYZVVSpDHIZ683Vr/is/RKAe5i9iGop1rp2R0/v/H1PGDQ9lIRQKygfOgjrK2frE2Io4+b0SrlJHDcQchJ7++4kQC3RHmKsIWUBv5slAVF09CChGeH+xSr5wBCdVoiHijgUhCZl/MXZajMybL6oE3CF2duUz5Pj4ha6a1wjRhgfx+2mjwzqWGVPzDxRcNSJbEO/dJ8NCBftqMfzerw5YbzsyQz47vQgIgACW9sX/MXMSuB6lph7aolUcGLk8E5k0ZwUy8Qu
x-ms-exchange-transport-forked: True
Content-ID: <5DDD81ADB4FF68469CBF63451B8FE689@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc72aa8-a7f6-4ff9-110e-08d79b644adf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 15:45:34.9204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJB1HSCiadr6vvoF18YRLs9c0p7vOcAjLzeoCO9pbL9LlOAIkZW20wJJ/ythA1RCEuolBEIijt0KmZZhBuYafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1433
X-OriginatorOrg: suse.com
X-MC-Unique: wUxWXIwpOPC9B1a2R9FSqQ-1
X-MC-Unique: diAuuo79O_e0Wb8ZTDf6Jg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HG7RiM019087
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/15] multipathd: warn when configuration
 has been changed.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> It would be helpful if multipathd could log a message when
> multipath.conf or files in the config_dir have been written to, both
> so
> that it can be used to send a notification to users, and to help with
> determining after the fact if multipathd was running with an older
> config, when the logs of multipathd's behaviour don't match with the
> current multipath.conf.
>=20
> To do this, the multipathd uxlsnr thread now sets up inotify watches
> on
> both /etc/multipath.conf and the config_dir to watch if the files are
> deleted or closed after being opened for writing.  In order to keep
> uxlsnr from polling repeatedly if the multipath.conf or the
> config_dir
> aren't present, it will only set up the watches once per reconfigure.
> However, since multipath.conf is far more likely to be replaced by a
> text editor than modified in place, if it gets removed, multipathd
> will
> immediately try to restart the watch on it (which will succeed if the
> file was simply replaced by a new copy).  This does mean that if
> multipath.conf or the config_dir are actually removed and then later
> re-added, multipathd won't log any more messages for changes until
> the
> next reconfigure. But that seems like a fair trade-off to avoid
> repeatedly polling for files that aren't likely to appear.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.h |   1 +
>  multipathd/main.c     |   1 +
>  multipathd/uxlsnr.c   | 134
> ++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 130 insertions(+), 6 deletions(-)

I know I reviewed this already, but this time I have some more remarks,
mostly style.

>=20
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index ffec3103..e69aa07c 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -188,6 +188,7 @@ struct config {
>  =09int find_multipaths_timeout;
>  =09int marginal_pathgroups;
>  =09unsigned int version[3];
> +=09unsigned int sequence_nr;
> =20
>  =09char * multipath_dir;
>  =09char * selector;
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 34a57689..7b364cfe 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2618,6 +2618,7 @@ reconfigure (struct vectors * vecs)
>  =09uxsock_timeout =3D conf->uxsock_timeout;
> =20
>  =09old =3D rcu_dereference(multipath_conf);
> +=09conf->sequence_nr =3D old->sequence_nr + 1;
>  =09rcu_assign_pointer(multipath_conf, conf);
>  =09call_rcu(&old->rcu, rcu_free_config);
> =20
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index bc71679e..92d9a79a 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -23,6 +23,7 @@
>  #include <sys/time.h>
>  #include <signal.h>
>  #include <stdbool.h>
> +#include <sys/inotify.h>
>  #include "checkers.h"
>  #include "memory.h"
>  #include "debug.h"
> @@ -51,6 +52,8 @@ struct client {
>  LIST_HEAD(clients);
>  pthread_mutex_t client_lock =3D PTHREAD_MUTEX_INITIALIZER;
>  struct pollfd *polls;
> +int notify_fd =3D -1;
> +char *config_dir;

Nit: please declare these as static, as they are used only in this
file. Also, naming the variable differently, e.g. conf_dir, would
decrease the number of false hits when grepping for the variable name.

> =20
>  static bool _socket_client_is_root(int fd);
> =20
> @@ -151,6 +154,8 @@ void uxsock_cleanup(void *arg)
>  =09long ux_sock =3D (long)arg;
> =20
>  =09close(ux_sock);
> +=09close(notify_fd);
> +=09free(config_dir);
> =20
>  =09pthread_mutex_lock(&client_lock);
>  =09list_for_each_entry_safe(client_loop, client_tmp, &clients,
> node) {
> @@ -162,6 +167,106 @@ void uxsock_cleanup(void *arg)
>  =09free_polls();
>  }
> =20
> +/* failing to set the watch descriptor is o.k. we just miss a
> warning
> + * message */
> +void reset_watch(int notify_fd, int *wds, unsigned int *sequence_nr)

This function could also be static.

> +{
> +=09struct config *conf;
> +=09int dir_reset =3D 0;
> +=09int conf_reset =3D 0;
> +
> +=09if (notify_fd =3D=3D -1)
> +=09=09return;
> +
> +=09conf =3D get_multipath_config();
> +=09/* instead of repeatedly try to reset the inotify watch if
> +=09 * the config directory or multipath.conf isn't there, just
> +=09 * do it once per reconfigure */
> +=09if (*sequence_nr !=3D conf->sequence_nr) {
> +=09=09*sequence_nr =3D conf->sequence_nr;
> +=09=09if (wds[0] =3D=3D -1)
> +=09=09=09conf_reset =3D 1;
> +=09=09if (!config_dir || !conf->config_dir ||
> +=09=09    strcmp(config_dir, conf->config_dir)) {
> +=09=09=09dir_reset =3D 1;
> +=09=09=09if (config_dir)
> +=09=09=09=09free(config_dir);
> +=09=09=09if (conf->config_dir)
> +=09=09=09=09config_dir =3D strdup(conf->config_dir);
> +=09=09=09else
> +=09=09=09=09config_dir =3D NULL;
> +=09=09} else if (wds[1] =3D=3D -1)
> +=09=09=09dir_reset =3D 1;
> +=09}
> +=09put_multipath_config(conf);
> +
> +=09if (dir_reset) {
> +=09=09if (wds[1] !=3D -1) {
> +=09=09=09inotify_rm_watch(notify_fd, wds[1]);
> +=09=09=09wds[1] =3D -1;
> +=09=09}
> +=09=09if (config_dir) {
> +=09=09=09wds[1] =3D inotify_add_watch(notify_fd,
> config_dir,
> +=09=09=09=09=09=09   IN_CLOSE_WRITE |
> IN_DELETE |
> +=09=09=09=09=09=09   IN_ONLYDIR);
> +=09=09=09if (wds[1] =3D=3D -1)
> +=09=09=09=09condlog(3, "didn't set up notifications
> on %s: %s", config_dir, strerror(errno));

Another nitpick: IMO we should be using "%m" for this in new code.

> +=09=09}
> +=09}
> +=09if (conf_reset) {
> +=09=09wds[0] =3D inotify_add_watch(notify_fd,
> DEFAULT_CONFIGFILE,
> +=09=09=09=09=09   IN_CLOSE_WRITE);
> +=09=09if (wds[0] =3D=3D -1)
> +=09=09=09condlog(3, "didn't set up notifications on
> /etc/multipath.conf: %s", strerror(errno));
> +=09}
> +=09return;
> +}
> +
> +void handle_inotify(int fd, int  *wds)

Again, static.

> +{
> +=09char buff[1024]
> +=09=09__attribute__ ((aligned(__alignof__(struct
> inotify_event))));
> +=09const struct inotify_event *event;
> +=09ssize_t len;
> +=09char *ptr;
> +=09int i, got_notify =3D 0;
> +
> +=09for (;;) {
> +=09=09len =3D read(fd, buff, sizeof(buff));
> +=09=09if (len <=3D 0) {
> +=09=09=09if (len < 0 && errno !=3D EAGAIN) {
> +=09=09=09=09condlog(3, "error reading from
> inotify_fd");
> +=09=09=09=09for (i =3D 0; i < 2; i++) {
> +=09=09=09=09=09if (wds[i] !=3D -1) {
> +=09=09=09=09=09=09inotify_rm_watch(fd,
> wds[i]);
> +=09=09=09=09=09=09wds[i] =3D -1;
> +=09=09=09=09=09}
> +=09=09=09=09}
> +=09=09=09}
> +=09=09=09break;
> +=09=09}
> +
> +=09=09got_notify =3D 1;
> +=09=09for (ptr =3D buff; ptr < buff + len;
> +=09=09     ptr +=3D sizeof(struct inotify_event) + event->len)
> {
> +=09=09=09event =3D (const struct inotify_event *) ptr;
> +
> +=09=09=09if (event->mask & IN_IGNORED) {
> +=09=09=09=09/* multipathd.conf may have been
> overwritten.
> +=09=09=09=09 * Try once to reset the notification
> */
> +=09=09=09=09if (wds[0] =3D=3D event->wd)
> +=09=09=09=09=09wds[0] =3D
> inotify_add_watch(notify_fd,
> +=09=09=09=09=09=09=09DEFAULT_CONFIGF
> ILE,
> +=09=09=09=09=09=09=09IN_CLOSE_WRITE)
> ;
> +=09=09=09=09else if (wds[1] =3D=3D event->wd)
> +=09=09=09=09=09wds[1] =3D -1;
> +=09=09=09}
> +=09=09}
> +=09}
> +=09if (got_notify)
> +=09=09condlog(1, "Multipath configuration updated.\nReload
> multipathd for changes to take effect");
> +}
> +
>  /*
>   * entry point
>   */
> @@ -173,13 +278,19 @@ void * uxsock_listen(uxsock_trigger_fn
> uxsock_trigger, long ux_sock,
>  =09char *reply;
>  =09sigset_t mask;
>  =09int old_clients =3D MIN_POLLS;
> +=09/* conf->sequence_nr will be 1 when uxsock_listen is first
> called */
> +=09unsigned int sequence_nr =3D 0;
> +=09int wds[2] =3D { -1, -1 };

Style issue: The code might be better readable if we used a struct for
this,

struct watch_descriptors {
=09int conf_wd;
=09int dir_wd;
};=09

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

